package fr.sita.sso.commons;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

// Referenced classes of package tools.utils:
//            EncodedProperties

public class Configuration {
	protected final static String UNIXSEPARATOR = "/";
	protected final static String WINSEPARATOR = "\\";

	protected static String os;
	protected static String envSeparator;

	private Configuration() {

	}

	public static synchronized void checkReload(String version, String type) {
		cpt++;
		if (cpt > 10000) {
			cpt = 0;
			dateNow = new Date(System.currentTimeMillis());
			now = dateNow.getTime();
			if (now - last > 0x493e0L) {
				propFiles_ = new Hashtable();
				allPropFiles_ = new Hashtable();
				last = now;
			}
		}
	}

	private static synchronized String getPropertyInternal(String key,
			String version, String service, String facility) {

		Properties props = null;
		String result = null;
		props = (Properties) allPropFiles_.get(service + version + facility);
		if (props == null)
			loadProperties(facility, version, service);
		props = (Properties) allPropFiles_.get(service + version + facility);
		if (props != null)
			result = props.getProperty(key);
		return result;
	}

	public static synchronized String getProperty(String key, int domainId,
			String service) {
		return getProperty(key, getShortName(domainId), service);
	}

	public static synchronized String getProperty(String key, String version,
			String service) {
		if (key == null || key.length() == 0)
			return null;
		if (service == null || service.length() == 0
				|| service.equals("common"))
			service = "";
		if (version == null || version.length() == 0)
			version = "";

		String facility = "";
		int p = key.indexOf('.');
		if (p == -1)
			return null;
		checkReload(version, service);
		facility = key.substring(0, p);
		String result = null;
		if (service.length() > 0 && version.length() > 0) {
			result = getPropertyInternal(key, version, service, facility);
			if (result != null)
				return result;
			result = getPropertyInternal(key, "", service, facility);
			if (result != null)
				return result;
			result = getPropertyInternal(key, version, "common", facility);
			if (result != null)
				return result;
			result = getPropertyInternal(key, "", "common", facility);
			if (result != null)
				return result;
		} else if (service.length() > 0 && version.length() == 0) {
			result = getPropertyInternal(key, "", service, facility);
			if (result != null)
				return result;
			result = getPropertyInternal(key, "", "common", facility);
			if (result != null)
				return result;
		} else if (service.length() == 0 && version.length() > 0) {
			result = getPropertyInternal(key, version, "common", facility);
			if (result != null)
				return result;
			result = getPropertyInternal(key, "", "common", facility);
			if (result != null)
				return result;
		} else if (service.length() == 0 && version.length() == 0) {
			// result = getPropertyInternal(key, "", "common", facility);
			result = getPropertyInternal(key, "", "", facility);
			if (result != null)
				return result;
		}
		return null;
	}

	public static synchronized String getProperty(String key,
			String defaultValue, int domainId, String service) {
		return getProperty(key, defaultValue, getShortName(domainId), service);
	}

	public static synchronized String getProperty(String key,
			String defaultValue, String version, String service) {
		String r = getProperty(key, version, service);
		return r == null ? defaultValue : r;
	}

	public static synchronized int getPropertyAsInteger(String key,
			int defaultValue, int domainId, String service) {
		return getPropertyAsInteger(key, defaultValue, getShortName(domainId),
				service);
	}

	public static synchronized int getPropertyAsInteger(String key,
			int defaultValue, String version, String service) {
		try {
			return Integer.parseInt(getProperty(key, version, service));
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public static synchronized long getPropertyAsLong(String key,
			long defaultValue, int domainId, String service) {
		return getPropertyAsLong(key, defaultValue, getShortName(domainId),
				service);
	}

	public static synchronized long getPropertyAsLong(String key,
			long defaultValue, String version, String service) {
		try {
			return Long.parseLong(getProperty(key, version, service));
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public static synchronized int getPropertyAsInteger(String key,
			int domainId, String service) {
		return getPropertyAsInteger(key, getShortName(domainId), service);
	}

	public static synchronized int getPropertyAsInteger(String key,
			String version, String service) {
		try {
			return Integer.parseInt(getProperty(key, version, service));
		} catch (Exception e) {
			return -1;
		}
	}

	public static synchronized long getPropertyAsLong(String key, int domainId,
			String service) {
		return getPropertyAsLong(key, getShortName(domainId), service);
	}

	public static synchronized long getPropertyAsLong(String key,
			String version, String service) {
		try {
			return Long.parseLong(getProperty(key, version, service));
		} catch (Exception e) {
			return -1L;
		}
	}

	/**
	 * @deprecated Method getConfDir is deprecated
	 */

	public static synchronized String getConfDir() {
		return confDir_;
	}

	/**
	 * @deprecated Method reload is deprecated
	 */

	public static synchronized boolean reload(String version, String type) {
		return true;
	}

	private static synchronized boolean loadProperties(String facility,
			String version, String service) {
		String propFile = "";
		if (version == null || version.length() == 0) {
			// propFile = ROOT_DIR + "\\" + service + "\\" + facility +
			// ".properties";
			propFile = ROOT_DIR + envSeparator + service + envSeparator
					+ facility + ".properties";
			version = "";
		} else {
			// propFile = ROOT_DIR + "\\" + service + "\\" + version + "\\" +
			// facility + ".properties";
			propFile = ROOT_DIR + envSeparator + service + envSeparator
					+ version + envSeparator + facility + ".properties";
		}

		FileInputStream in = null;
		try {
			propFiles_.put(service + version + facility, Boolean.FALSE);
			in = new FileInputStream(propFile);
			Properties props = new Properties();
			props.load(in);
			in.close();
			allPropFiles_.remove(service + version + facility);
			allPropFiles_.put(service + version + facility, props);
			propFiles_.put(service + version + facility, Boolean.TRUE);
			return true;
		} catch (Exception e) {
		}
		try {
			if (in != null)
				in.close();
		} catch (Exception exception) {
		}
		return false;
	}

	/**
	 * @deprecated Method setProperty is deprecated
	 */

	public static synchronized void setProperty(String s, String s1, String s2,
			String s3) {
	}

	public static synchronized void reloadNow(String version, String service) {
		propFiles_ = new Hashtable();
		allPropFiles_ = new Hashtable();
	}

	public static synchronized void setStringProperty(String key, String value,
			String version, String service) {
		saveProperties(key, value, version, service);
	}

	private static synchronized void saveProperties(String key, String value,
			String version, String service) {
		if (key == null || key.length() == 0)
			return;
		if (service == null || (service.length() == 0)
				| service.equals("common"))
			service = "";
		if (version == null || version.length() == 0)
			version = "";
		String facility = "";
		int dotIx = key.indexOf('.');
		if (dotIx == -1)
			return;
		facility = key.substring(0, dotIx);
		String propFile = "";
		if (service.length() > 0 && version.length() > 0)
			propFile = ROOT_DIR + envSeparator + service + envSeparator
					+ version + envSeparator + facility + ".properties";
		else if (service.length() > 0 && version.length() == 0)
			propFile = ROOT_DIR + envSeparator + service + envSeparator
					+ facility + ".properties";
		else if (service.length() == 0 && version.length() > 0)
			propFile = ROOT_DIR + envSeparator + "common" + envSeparator
					+ version + envSeparator + facility + ".properties";
		else if (service.length() == 0 && version.length() == 0)
			propFile = ROOT_DIR + envSeparator + "common" + envSeparator
					+ facility + ".properties";
		EncodedProperties tmp = new EncodedProperties(facility);
		Properties props = new Properties();
		try {
			FileInputStream in = new FileInputStream(propFile);
			props.load(in);
			in.close();
			String p = null;
			for (Enumeration e = props.propertyNames(); e.hasMoreElements();) {
				p = (String) e.nextElement();
				String tmp_value = props.getProperty(p);
				if (tmp.getProperty(p) == null && key.compareTo(p) != 0)
					tmp.setProperty(p, tmp_value);
			}

		} catch (Exception e) {
			System.err.println("Configuration: in save properties read "
					+ propFile + ": " + e.toString());
		}
		try {
			FileOutputStream out = new FileOutputStream(propFile);
			tmp.setProperty(key, value);
			tmp.store(out, "");
			out.close();
		} catch (Exception e) {
			System.err.println("Configuration: in save properties write "
					+ propFile + ": " + e.toString());
		}
	}

	public static String getConfDir(int domainId, String service) {
		return getConfDir(getShortName(domainId), service);
	}

	public static String getConfDir(String version, String service) {
		if (service == null || service.length() == 0)
			service = "common";
		if (version == null || version.length() == 0)
			return ROOT_DIR + envSeparator + service;
		else
			return ROOT_DIR + envSeparator + service + envSeparator + version;
	}

	public static void setConfRootDir(String rootDir) {
		ROOT_DIR = rootDir;

		os = System.getProperty("os.name");
		if (os.indexOf("Windows") != -1)
			envSeparator = WINSEPARATOR;
		else
			envSeparator = UNIXSEPARATOR;

	}

	private static String getShortName(int domainId) {
		return (String) shortNames.get((new StringBuffer(String
				.valueOf(domainId))).toString());
	}

	private static String confDir_ = null;
	private static Hashtable propFiles_ = new Hashtable();
	private static Hashtable allPropFiles_ = new Hashtable();
	private static Date dateNow;
	private static long last;
	private static long now;
	private static int cpt = 0;
	private static String ROOT_DIR;
	private static final String COMMON_DIR = "common";
	private static Hashtable shortNames = new Hashtable();

	static {
		dateNow = new Date(System.currentTimeMillis());
		last = dateNow.getTime();
		now = dateNow.getTime();
	}
}