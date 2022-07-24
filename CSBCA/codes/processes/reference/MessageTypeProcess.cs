using System;
using System.Diagnostics;
using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;

namespace CSBCA.codes.processes
{
    public class MessageTypeProcess : BaseProcess
    {
        public new MessageTypeParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, MessageTypeParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}
