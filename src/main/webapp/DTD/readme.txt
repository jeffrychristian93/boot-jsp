This DTD folder is ad hoc solution
to handle proxy problem in PTX intranet.
Without all DTD's here, the PDF generation will
fail since the XHTML needs validation from DTD.

It makes all JSPs header must be changed from

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


into

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://<%=request.getLocalAddr()%>:<%=request.getLocalPort()%>/<%=request.getContextPath()%>/DTD/xhtml1-transitional.dtd">


