Return-Path: <SRS0=/xYu=TF=quicinc.com=quic_vgarodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99735E7717F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Dec 2024 09:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68EBAC4CED4; Thu, 12 Dec 2024 09:23:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 418CFC4CED1;
	Thu, 12 Dec 2024 09:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 418CFC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7EOBp014897;
	Thu, 12 Dec 2024 09:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCzq9nl+e0MVogwchhk3psYl3sHP7LmcBDKXFNIhstA=; b=CDrHFK1l8OWLbw/e
	1PERW+yvXpZJi2L5zzEFEDpOGc+FIJ6Ld5MwpDQC4DSK1OLmwcaC/eSEUgojknRc
	COSa3xGAL9CsUxE1NInsYXayZvZWcpWc5oosHBcjGX0Y9m5M+KqwwLGvOAheX/KM
	zwkYfZaqOFdQQkim0BPbzLzbnfQq2TCj98IijAYIOU3uGd/IYDV/dalQ+46ojSAF
	2GvHUGCkwjNYpol6eRXOr2XZ9TJazidv14JbqwP9Sz22NJniXvnlyZwF5AZIX6vR
	Pk/JT3C/i+8+xSVlYw8dlKu2BPRo7kEqaGLRJ4RYalswiU8m3lOTyF8VJBQCDQbw
	aS0z1g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpkmpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:23:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9NRCL014559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:23:27 GMT
Received: from [10.216.55.174] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 01:23:25 -0800
Message-ID: <6efc5b19-563c-c170-c2d6-179fef78ffeb@quicinc.com>
Date: Thu, 12 Dec 2024 14:53:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: add venus firmware file for qcs615
Content-Language: en-US
To: Josh Boyer <jwboyer@kernel.org>,
        "Renjiang Han (QUIC)"
	<quic_renjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Dikshita Agarwal
 (QUIC)" <quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)"
	<quic_qiweil@quicinc.com>,
        "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yhXIj4BV01xQtFtepGEX1iHv8ZbCBhQP
X-Proofpoint-ORIG-GUID: yhXIj4BV01xQtFtepGEX1iHv8ZbCBhQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 mlxlogscore=885 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120065

Hello Josh,

On 11/13/2024 5:52 PM, Josh Boyer wrote:
> On Wed, Nov 13, 2024 at 5:50 AM Renjiang Han (QUIC)
> <quic_renjiang@quicinc.com> wrote:
>>
>> Hello
>>
>>
>>
>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
>>
>>
>>
>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>>
>>
>>
>> are available in the Git repository at:
>>
>>
>>
>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-firmware-qcs615
> 
> Merged and pushed out.
With this, we have now 2 binaries in qcom/venus-5.4 folder, namely venus.mbn and
venus_s6.mbn. There are no active client using venus_s6.mbn at the moment, and
it was added to support video usecase on qcs615. It seems like qcs615 can use
venus.mbn itself and we do not need separate bin. Let me know if you are good to
delete venus_s6.mbn, given that there are no active client using it. If you are
ok, we will raise a PR to delete it and update venus.mbn. You can find the more
discussion here [1] on the same.

[1]
https://lore.kernel.org/all/ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy/T/

Regards,
Vikash
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/370
> 
> josh
> 
>>
>>
>>
>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
>>
>>
>>
>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
>>
>>
>>
>> ----------------------------------------------------------------
>>
>> Renjiang Han (1):
>>
>>       qcom: venus-5.4: add venus firmware file for qcs615
>>
>>
>>
>> WHENCE                      |   1 +
>>
>> qcom/venus-5.4/venus_s6.mbn | Bin 0 -> 922240 bytes
>>
>> 2 files changed, 1 insertion(+)
>>
>> create mode 100644 qcom/venus-5.4/venus_s6.mbn
>>
>>
>>
>> Best Regards,
>>
>> Renjiang
