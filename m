Return-Path: <SRS0=mYkV=RS=quicinc.com=quic_vpuar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9997CDD0C6
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Oct 2024 19:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7026EC4CEC7; Tue, 22 Oct 2024 19:09:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24AF0C4CEC3;
	Tue, 22 Oct 2024 19:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24AF0C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MGTYIj014452;
	Tue, 22 Oct 2024 19:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q6GN3HHTHeHULD6kvxqj5naDnJVXu0MTr/R3XcE+hYA=; b=SxlnR+DNL606EAK2
	PzMG7tRiAEx31fA6JjoRrsHvGKK4RUHeyZCvU8+aGkHpSATkxrTZ24XabT7TXOsK
	B89vkY573LIODRNtwcHmS4QY/cvidfUmbMGkG3K+o81unEhN5WnGXSl4Pl0euDTw
	Y9cx4gFG5gN8h1KRYhA8mI6nw4TfPcpSW6TW+7TXzhstpYT8bW+5+QzoTmTqroyp
	FnMkpurwxiFQsYR76AcoZDB7QHZDi3f8FwAi/UUSjmJN5x2ctv+PYcwlcZDBA/RJ
	slQwXRvzndohB5b5T9uZW00d8y/80907jrbueSBM3UIhA3okSk6prYM4v5Nbq08i
	bSQqdw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd5mmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 19:09:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MJ9Qi0021008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 19:09:26 GMT
Received: from [10.216.17.121] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 12:09:25 -0700
Message-ID: <c37774af-29b0-4b5d-9793-78e976b8e81d@quicinc.com>
Date: Wed, 23 Oct 2024 00:39:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: check_whence.py: Add function to get listing of files
To: Emil Velikov <emil.l.velikov@gmail.com>, Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>
References: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com>
 <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
 <CACvgo520miap4jYcKOgirscGzhZiM3TzrT8-18FTZ16gZ7ERhw@mail.gmail.com>
Content-Language: en-US
From: Vivek Puar <quic_vpuar@quicinc.com>
In-Reply-To: <CACvgo520miap4jYcKOgirscGzhZiM3TzrT8-18FTZ16gZ7ERhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7yrtQuARIrinO0jWS_MnHBx7QrMuXF5v
X-Proofpoint-GUID: 7yrtQuARIrinO0jWS_MnHBx7QrMuXF5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=955
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410220123

Hi,

I've created another pull request, please review it.

The following changes since commit e1d95775eb3db64ab3740701bf9682e5856aab2e:

   Merge branch 'intel/xe3lpd-dmc' into 'main' (2024-10-22 14:50:56 +0000)

are available in the Git repository at:

   https://github.com/vivpuar/linux-firmware mine

for you to fetch changes up to 306d081594df8a449d07565217153c40b6136646:

   check_whence.py: Add function to get listing of files (2024-10-23 
00:32:57 +0530)

----------------------------------------------------------------
Vivek Puar (1):
       check_whence.py: Add function to get listing of files

  check_whence.py | 36 ++++++++++++++++++++++++------------
  1 file changed, 24 insertions(+), 12 deletions(-)

On 10/22/2024 6:49 PM, Emil Velikov wrote:
> Hi Vivek,
>
> On Tue, 22 Oct 2024 at 13:20, Josh Boyer <jwboyer@kernel.org> wrote:
>> On Fri, Oct 18, 2024 at 6:22 AM Vivek Puar <quic_vpuar@quicinc.com> wrote:
>>> Hi,
>>>
>>> Please find below git pull request to update check_whence.py file.
>>>
>>>
>>> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
>>>
>>>     Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17
>>> 15:40:04 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://github.com/vivpuar/linux-firmware
>>>
>>> for you to fetch changes up to 95c238e821c95749b50f24f9b6fed080417daadf:
>>>
>>>     check_whence.py: Add function to get listing of files (2024-10-18
>>> 15:19:04 +0530)
>>>
>>> ----------------------------------------------------------------
>>> Vivek Puar (1):
>>>         check_whence.py: Add function to get listing of files
>> This doesn't apply cleanly any longer.  Can you rebase it?
>>
> I worked around the root issue in a different way with
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/339.
> Your approach looks reasonable, plus I don't have an opinion on the
> route we take.
>
> If you prefer we fallback to file listing, can you please open a MR
> against the gitlab repo and I would happily review it.
>
> Thanks o/
> Emil

Regards,

Vivek

