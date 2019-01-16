<%!
/** 
         * 从中文字符串中取字串，并保持中文字符不断 
         * 返回的字符串长度 小于等于要求的长度 
         * @param str String the string want to substring 
         * @param b int the position of begin 
         * @param e int the position of end 
         */ 
        public static String substringChinese(String str,int b,int e) 
        { 
                if(str==null || str.equals("")) return str; 
                if(e<=0) return null; 
                int strlen=str.length(); 
                int lastp=e>strlen ? strlen:e; 
                int firstp=b>0 ? b:0; 
                if(lastp<=firstp) return null; 
                byte strbytes[]=str.getBytes(); 
                byte retbytes[]=new byte[lastp-firstp]; 
                boolean cn=false; 
                int i=firstp; 
                for(i=firstp;i<lastp;i++)
                {
                        if(cn)
                        {
                                retbytes[i-firstp]=strbytes[i];
                                cn=false;
                                continue;
                        }
                        if(ChineseChr(strbytes[i]))
                        {
                                cn=true;
                                if(i>=(lastp-1))	//it could not be a Chinese Charactor at the end of the string. 
                                { 
                                        break; 
                                } 
                        } 
                        retbytes[i-firstp]=strbytes[i]; 
                } 
                int retlen=i-firstp; 
                if(retlen<=0) return ""; 
                String ret=new String(retbytes,0,retlen); 
                return ret; 
        }


 public static boolean ChineseChr(byte b)
        {
                if(b>=0) return false;
                else return true;
        } 
%>
