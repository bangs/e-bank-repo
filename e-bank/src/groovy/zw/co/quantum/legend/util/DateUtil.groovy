package zw.co.quantum.legend.util

class DateUtil {

	static Date addYearsToDate(Date date, Integer years) {
		Calendar c = Calendar.getInstance()
		c.set(Calendar.YEAR, c.get(Calendar.YEAR) + years)
		return c.getTime()
	}
}
