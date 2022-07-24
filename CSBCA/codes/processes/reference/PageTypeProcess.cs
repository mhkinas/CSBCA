using System;
using System.Diagnostics;
using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;

namespace CSBCA.codes.processes
{
    public class PageTypeProcess : BaseProcess
    {
        public new PageTypeParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, PageTypeParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}
