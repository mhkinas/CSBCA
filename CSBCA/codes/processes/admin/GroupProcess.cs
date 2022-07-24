/**
   csbca - v1.0 - 2020-10-12
   https://www.hayatikinas.com
   This code is part of the CSBCA project
   And it can be used under license terms.
   Copyright Mehmet Hayati KINAŞ
 */

using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;


namespace CSBCA.codes.processes
{
    public class GroupProcess : BaseProcess
    {
        public new GroupParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, GroupParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}
