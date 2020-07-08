package fr.sita.sso.commons;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Properties;

// Referenced classes of package tools.utils:
//            EncodedProperties

public class EncodedProperties extends Properties {
	private Charset c = null;
	private String facility = null;

	public EncodedProperties(String facility) {
		super();
		this.facility = facility;
	}

	protected void finalize() throws Throwable {
		c = null;
		super.finalize();
	}

	public void store(OutputStream out, String header) throws IOException {
		String charset = this.getProperty(facility + ".Charset");
		if ((charset == null) || (charset == "UTF-16")) {
			super.store(out, header);
			return;
		}
		if (out == null)
			throw new NullPointerException();

		try {
			c = Charset.forName(charset);
		} catch (UnsupportedCharsetException uce) {
			c = Charset.forName("US-ASCII");
		}

		if (!c.canEncode()) {
			c = Charset.forName("US-ASCII");
		}

		Collection values = this.values();
		Iterator iter = values.iterator();
		Object o = null;
		while (iter.hasNext()) {
			o = iter.next();
			if (!(o instanceof String)) {
				throw new ClassCastException();
			}
		}

		o = null;
		iter = null;
		values = null;

		String s = null;

		if (header != null) {
			s = "#" + header + "\n";
			out.write(s.getBytes());
			s = null;
		}

		Date d = new Date();
		s = "#" + d.toString() + "\n";
		out.write(s.getBytes());
		s = null;
		o = null;

		Enumeration keys = this.propertyNames();
		String k = null, v = null;
		StringBuffer sb = new StringBuffer();

		char cc;

		while (keys.hasMoreElements()) {
			k = (String) keys.nextElement();
			v = this.getProperty(k);

			sb.delete(0, sb.length());
			for (int i = 0; i < v.length(); i++) {
				cc = v.charAt(i);
				switch (cc) {
				case ':':
					sb.append("\\:");
					break;
				case '=':
					sb.append("\\=");
					break;
				case '!':
					sb.append("\\!");
					break;
				case '#':
					sb.append("\\#");
					break;
				case '\t':
					sb.append("\\t");
					break;
				case '\f':
					sb.append("\\f");
					break;
				case '\n':
					sb.append("\\n");
					break;
				case '\r':
					sb.append("\\r");
					break;
				case '\\':
					sb.append("\\\\");
					break;
				default:
					sb.append(cc);
					break;
				}
			}

			s = k + "=" + sb.toString() + "\n";
			out.write(c.encode(s).array());

		}
		out.flush();

		k = null;
		v = null;
		keys = null;
		sb = null;

	}

}