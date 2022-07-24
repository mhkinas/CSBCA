using System;
using System.Diagnostics;
using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;

namespace CSBCA.codes.processes
{
    public class FileTypeProcess : BaseProcess
    {
        public new FileTypeParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, FileTypeParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}
