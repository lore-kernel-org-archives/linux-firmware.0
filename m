Return-Path: <SRS0=Lr+t=DQ=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33519C001DF
	for <linux-firmware@archiver.kernel.org>; Sun, 30 Jul 2023 19:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE101C433C9; Sun, 30 Jul 2023 19:13:06 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71CEEC433C7;
	Sun, 30 Jul 2023 19:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71CEEC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnlWeE/d+J9jL8njm7ziXv61TquR1/Uhp4ZyfpgbXrWAnGXLk6d9PiZUazHXoJkCi0s4GvBlLL8Pw9TBS3nEUncz/qQgG/p/nLjecSld1Ti2lPVEjr1dMJjCVzbt5O6qppJ5EkSC36hGQygXOxJ1C3q4teoHl7Jc4yUYQDIH9qmzaocKSXXg49YMWZtU3b7lC8dBZ56+sWY5gXj1aZhwrkD5VDw4+zNwfe50Wpekme1YWMF9LvoIO4fEMUGwWD6SYoBcnmISZ6Jegi8552KXX1yrcFVx48e1fHPQR1O2hAINrvInL3ldKTi3sGgV7vAbMXAj8JdUAGNwYZAGUcV0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPxBq/SO1J1QB/WI9Pw2Toqq4QTKcAxljTyzRu0l7Xw=;
 b=cF1SLHKgIYYiRHP2m0DdRPVAmAuTbt5Y5/ugn1ljgkTtUI37bkA6MRps0QUg/ceaFdnsK42Fs/xFr9OWKiFMbZ71SJKzPCJhWjlRB+xOR0/WT5sXNrGQGlSgD9NhAJFu55Uop7MPJyTzFcWKsBbwGwLcRiq//xOwBZJ3ksROtK0kK2EsyB5XrjgUE2fy9KtMoCf1bKcJ3Rtt9qfpQhnv+8b8n50y4sWeouDWuLRGX9gwog3qAjeP9Ja6GW6KvQzp+1euvZ5PJuqRdP6HxW+kvIQgMx1+YIxkTQhWpcydUCzXn/qODxf2eSBcnYHXM0uXpUldxYtyt+bR3sxGa+M9Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPxBq/SO1J1QB/WI9Pw2Toqq4QTKcAxljTyzRu0l7Xw=;
 b=dDQRE3ma3cd/sdSO91VXFVSKD1ql1let4O0cVBxWaJQFIilOVX1ELeVjkcF0wD59yBOhQjW9SSOpvxA24eUB6ZsovrShTHQN6/QhlVtBfmq3TTg1rmtDpzH6PlZXsXjuWlbNQYfsu2JBRKbwD3BYSstqTybvRNWpzeoQfJ62VKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6058.namprd12.prod.outlook.com (2603:10b6:930:2d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Sun, 30 Jul
 2023 19:13:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6631.041; Sun, 30 Jul 2023
 19:13:02 +0000
Content-Type: multipart/alternative;
 boundary="------------YR1VI0tKYIsfOAeni8jWfA09"
Message-ID: <9c20a7d3-a379-c58b-131e-ade683b93bf3@amd.com>
Date: Sun, 30 Jul 2023 14:12:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: AMDGPU DCN firmware update WW30
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 Josh Boyer <jwboyer@kernel.org>, Linux Firmware <linux-firmware@kernel.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <CH0PR12MB5284AF2A1EA71C470BFF7DBD8B06A@CH0PR12MB5284.namprd12.prod.outlook.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CH0PR12MB5284AF2A1EA71C470BFF7DBD8B06A@CH0PR12MB5284.namprd12.prod.outlook.com>
X-ClientProxiedBy: SA0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:806:130::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1e8d00-3d5d-4a28-e71f-08db9130fea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J7YX9+oqYVCbnPGhUBCej/rT1i7SRwvgg/u2etQJ363I0QbKl/NM3jTS45ZttjR2DTnOyBA4maSnpUz6k7f0Pc1GED58ahdQSfTBe7Nbxywqdh+UJlqm2UO+oR6hvC3a4a9uPe8jN7Ufof84MGno+DnYttpqD9Y1m9vO7H7AonZIk84KJ2LlxPidi9vj43A1d4rw+EpMGPJddLDJEuVtBy41Zp65YFNxsKroBg2VWelaEnfgWrMENAp5c+0NH+LbSVmOA6K2iCMmvW5XB+EHCuIfhvjZNA0mzozNtWmHK4eI4l1sdPNFp7Pw+Ly5CAzV83WNzMI/r4L7F/Ju87KBIbKF18hIazTo7qFKRNzb/3Uy4jEyQ8jqaQAGChDlHu3wxTfdpSydtabomCginQVQK66oHk0ZTqUxQ330REoGGVPbGNjc9Wqxb1O+ju30sGkuzNpXmaVB2rbwPA/oR+2JH99oDHun9hFVS0DLysZC0xg8Qob6Gfgj6X/58yD2iCRHuqLvrCZ5QY3WyZPllBqUlJTQ737XtfU0CrbYu1VdJ1YVW2lwToCvb4WYHJJ3/FBRmwhlI17EkrM9U8PaChDg/8BvOTlMyPLgkdrMV3nab4ZH84jJlmCFflFGQgKeTgyI+p8uXrrsV4eMereSLuCIlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199021)(6512007)(6666004)(6486002)(33964004)(186003)(83380400001)(2616005)(36756003)(86362001)(31696002)(38100700002)(6506007)(53546011)(450100002)(5660300002)(15650500001)(41300700001)(8936002)(8676002)(31686004)(66946007)(4326008)(66556008)(66476007)(2906002)(19627405001)(316002)(478600001)(110136005)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEpNcjU5dDJualp2WW9NTDBqY2xaVVZnTjhIalBkeW1rYUdRTVpHRDNBbHda?=
 =?utf-8?B?Z1FnUVZrL2NsZGpYSnNidVF5U2lOanJVMXBXRmJQRjRIWTliS3VQVFRaRjFO?=
 =?utf-8?B?KzFrM0crNkFVaDIyU3krRUpSODhBTklGTlVNWkc5ejI0dlU1NGRmYXpMMEdE?=
 =?utf-8?B?V01vdXcrOUI3SU5YU29PTHJ3QW5qSzNJSWR6NmZHQ2R3NjFXSFYyTFFlVE5t?=
 =?utf-8?B?cjc1b2k5blpzSGh4SEgzTTBGMUxESHRLbm1jUDlhOXNvT1lCanUrdWd3YUNz?=
 =?utf-8?B?ckRaMk1WVWF4Q3paN3hndVFvbVFueFAxMWFMNlcyTGJ2RldQbExFK2dXTkRl?=
 =?utf-8?B?NHJYUUdFRVZ3cmxBNE1mMkhQM3RpMnRkZzRzTHR1Z1Mzek55Q3F2RmZWMnJJ?=
 =?utf-8?B?U3VBRWEyd1c5OXorT2N3cytCbzJ2dlF3ZW0wQUtDeEloWnRkRGgxeHdTcnIy?=
 =?utf-8?B?cFZSZldzdDRVTmdodTJoNXdSd3dGZ3JhQXFhbSthL2Ywb2RCVXExb2JJYkVH?=
 =?utf-8?B?MG1rNDc4ZmtleWV5Q241eTY0RFJBTE1mV09MbmhWT0UySC9TaEJwTGsxemdv?=
 =?utf-8?B?T0NzaEZZK3ExdWV5NXVGVFpyQXRia2ZLdXhQaS85MThEcHFIWHh6djQ2VndM?=
 =?utf-8?B?RmNsNnJVM2QxOXZrMUhMVEcyNE9jZDE3QXpwMlFJSTR0R1ZwazBLQmlqMzVH?=
 =?utf-8?B?MGVhalZOTVZWUzVQZ1o3RUUyMWFwb3ZLdjVlY0U2NG9CU0tQRjkvYUpRS0Z3?=
 =?utf-8?B?T1IxbjVvWTNIckJEZkdocEE2WVY3WVdZQy9QN2ZwNlVWWmo4K1M0aWx5cUph?=
 =?utf-8?B?VVVVanpDV21kMTVaTUxzaU5YeWJUVDAweFByTnpKeGtrTjd1MHpRdmo1Unlj?=
 =?utf-8?B?U25Zd3JPY2hxQVBnMWhsSEE5QmxTSVQ0N28zc3JnSkhXZlZIR24yNUlLVVNJ?=
 =?utf-8?B?OG5NSGRUc3FwOUVnVkJMeHduU29IUXNmckZ2OHR3SFltQm02SnRHQXpDbjZs?=
 =?utf-8?B?RHJrV0RoekF0TXh1aG0wTG1LOGRHbTRRVGdYaEduY0tuQXBUb250N1UyaHZI?=
 =?utf-8?B?b0JJSm9sc1I1c3pNYmIvbk54bm0ySmZZNDFMcjJpcHpOOGdHbWQ3RTIzeGVE?=
 =?utf-8?B?ZHcxb21lbFJWZ011c3QwcnJsMS9yQWsxZUR0NDVjNzBsZVhKMzJBQ0c2c09T?=
 =?utf-8?B?d2tpNTNwZUt5ZzlnckVQUjdNYTZ4WlI5TWZRalpWYitodFJtWWc4ZDFvanRs?=
 =?utf-8?B?emYrb2tyTndxVE5Tc2FMaktSUTdKK1lSQllvUktkaW5SRzNnZUtBYUZMRjJO?=
 =?utf-8?B?VnpGbnY3UmZ6c3kvSFJBSjR3SFFDM3ZPdXZXRU0rV2dweFRYbkJ3anhtd0Zk?=
 =?utf-8?B?dnNXb1l3blBXaDc5N09LL015MFY1WWhkWUVBRHNWckJwdEhhT1cwWEh1NHR3?=
 =?utf-8?B?NjNlRkxCRk9sTEVNeGd0WU9kQWpGWXllbmFtVWdHSG5ETUJYMWtnZlYzMEll?=
 =?utf-8?B?M0ZUTmNkeTBYZURIZHJVWUR3Qmt1MW1qd0IvemM3Y1F6bDFVVFVadjc4NGRH?=
 =?utf-8?B?YlhzbnBYeS9CKzdLSEZjQlZSNXdwbWdoTEdQd213aC82ZjJTanVFVVhQMEZV?=
 =?utf-8?B?MEJQeHNaTk91dkxweWlSeHVNM2pKVkY3UXJIaU5vTnduRTNoQWRhT2RrTW5V?=
 =?utf-8?B?aVVTbXBVSnBMaWdIbGFqZ2JJbnp1S2xvRFk1Vm1HUVZKZDA2TUlMbTQvR0Ns?=
 =?utf-8?B?VDlURlZQUTdFSzhiME8rM0ZtenhYV1lyTEtsWVBhV215OWp6Yk5wRUY2Nk9q?=
 =?utf-8?B?cTgrZVQyMHczeG5ZK3YxMTlmazR3K3orMVpXa3lwNTVpZnc4dnBEM0c4N1Ba?=
 =?utf-8?B?VmpXTm93NWhweG9xK0NKR0tJckFzMmdWVUFzbHZwV1FuN2pNdFNNdzRRdHgr?=
 =?utf-8?B?NW5PSmJnaDZtS0lLSWVFejJMVDZpYk1obHJST2l3cjd3Mk1jNm4yYlY0SXFD?=
 =?utf-8?B?UFd0TXlqdFAvK3ptbjZpRHVvWWtQTUZqNW9ZaHFySGlJMTBRZkRRNkxrbHlC?=
 =?utf-8?B?WmJ0cFEvWldWSEs2SUtubjJRRDNpbG5FZ0dQTzdaS29DREhibVhnT0YrcWFo?=
 =?utf-8?B?RDJDL2t3a1BwL2Y4YXZPU3hRdERkaG5PMXlHTFhiQTluZTE1WXV3emZvM2RU?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1e8d00-3d5d-4a28-e71f-08db9130fea8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2023 19:13:02.1609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3cYZmoLhTGNFtnrRlR1+gWzR9BjTJ3jrydOtk0vfZkMeK3kwLWCROF/BYjyA2qkuZBI/VjIznTJLtbQVOt52A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6058

--------------YR1VI0tKYIsfOAeni8jWfA09
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jay,

Usually these are sent as .PATCH files relative to linux-firmware.git so 
that Josh can just apply them.
The other alternative would be to make a branch on a git repo and let 
Josh pull from that.

Can you re-send them as such?

Thanks,

On 7/28/23 15:31, Pillai, Aurabindo wrote:
>
> [AMD Official Use Only - General]
>
>
> Hi Josh,
>
> Please pull in DMCUB fw updates for DCN314 and Yellow Carp from the 
> attached files.
>
> Release 8.0.30.0 for DCN314
> Contains fixes for ABM, Z10, PSR-SU, TBT
>
> Release 4.0.62.0 for Yellow Carp
>  Fixes a randon screen freeze for a vendor specific TCON
>
>
> --
>
> Regards,
> Jay

--------------YR1VI0tKYIsfOAeni8jWfA09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Jay,<br>
      <br>
      Usually these are sent as .PATCH files relative to
      linux-firmware.git so that Josh can just apply them.<br>
      The other alternative would be to make a branch on a git repo and
      let Josh pull from that.<br>
      <br>
      Can you re-send them as such?&nbsp; <br>
      <br>
      Thanks,<br>
      <br>
      On 7/28/23 15:31, Pillai, Aurabindo wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CH0PR12MB5284AF2A1EA71C470BFF7DBD8B06A@CH0PR12MB5284.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
        [AMD Official Use Only - General]<br>
      </p>
      <br>
      <div>
        <div class="elementToProof" style="font-family: Calibri, Arial,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          Hi Josh,</div>
        <div class="elementToProof" style="font-family: Calibri, Arial,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div class="elementToProof" style="font-family: Calibri, Arial,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          Please pull in DMCUB fw updates for DCN314 and Yellow Carp
          from the attached files.
          <br>
        </div>
        <div class="elementToProof" style="font-family: Calibri, Arial,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div class="elementToProof">Release 8.0.30.0 for DCN314<br>
        </div>
        <div>Contains fixes for ABM, Z10, PSR-SU, TBT</div>
        <div class="elementToProof" style="font-family: Calibri, Arial,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div class="elementToProof ContentPasted2" style="font-family:
          Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color:
          rgb(0, 0, 0);">
          Release 4.0.62.0 for Yellow Carp</div>
        <div class="elementToProof ContentPasted2 ContentPasted3" style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          &nbsp;Fixes a randon screen freeze for a vendor specific TCON<br>
        </div>
        <div class="elementToProof" style="font-family: Calibri, Arial,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div class="elementToProof" style="font-family: Calibri, Arial,
          Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div class="elementToProof">
          <div id="Signature">
            <div>
              <div style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                --</div>
              <div style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                <br>
              </div>
              <div style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Regards,</div>
              <div style="font-family: Calibri, Arial, Helvetica,
                sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
                Jay<br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------YR1VI0tKYIsfOAeni8jWfA09--
