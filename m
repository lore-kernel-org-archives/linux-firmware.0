Return-Path: <SRS0=UAI4=32=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68900CAC593
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Sep 2025 11:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36457C4CEF5; Mon, 15 Sep 2025 11:15:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B439C4CEF1
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 11:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B439C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8Fhex014092
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 11:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	04mB9Ev9kpgECY09/m6dkqOG7Y7mkW2O+7I6i5qVhTU=; b=PUGgEPyDpvDjoGoz
	IN1T5H10yKo6SrY+DU3yN3G6EzXyxSbOxKKWuBfuoYa1LLs+sdMDJ/0MV+/Zu9ZV
	PR0pELuN6O7w9QmYKgB4oA8roFbEH2SDPbF6KR0dp2GCvs6mfIG8JFTeKp7ZZZiT
	TqmCU6R6eDJpDkh6NkrzHpXpXQbbX6/A41jE4X2euP9GROh06plDtbPqGHjAvabi
	cPEw6oY6/NTiuLKyawvQzc2h8mGkkXxLhEMU1v/Fsxrf0Yw6bEgRXmiVzucIwvTS
	RjjqSD1DY+UoYonX3BsgvITX2Vib3rV2IRW4pwi18bdAm1AIj6yxHlZqligPVbYK
	/h43pw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr4wju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 11:15:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58FBFAXP020191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 11:15:10 GMT
Received: from [10.50.6.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 15 Sep
 2025 04:15:08 -0700
Message-ID: <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
Date: Mon, 15 Sep 2025 16:44:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UWSek8saEqDf8xkl_lN_koY1Sh6EshWJ
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c7f53f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8
 a=NEAV23lmAAAA:8 a=7XQqbj0YUtKCItFlsc0A:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfXxwZMIV2eIJ1a
 obQhXMCog1tfBNMKwHw+Q0kiQOOdByb+gQZGpWin0MtCdDAezdMEtB3L6Fr71JGRcswo0zYF2mf
 znD8p7JGCsW6Kgse6UWkXVjqALRLaV4z/gVn8Bhd/xnDUEHz9oc6xfwCtZwp/Xnta5bp7aJJa4+
 LGnMsza5tcHyEZmTjzcdluFtsXoCN3aG/4/mgQ13bew9IQmmmcyLeU2mIz/hoW1ztEynenwQv+f
 dMePOjX9FROQnSm7/TX4kPvtQQZoZsKOr0BDeY1L1w6R3EY1Fcfsavhw8aqsNyJZ/W7N1YT9vuV
 GQ7w30jo+hSno3UyqMiP5CDCvcLZtLVvXr7BC5QxQda2e2+os2ige//ZUecO1MYj/Lwc+d/Avip
 XXQROL+x
X-Proofpoint-GUID: UWSek8saEqDf8xkl_lN_koY1Sh6EshWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000



On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
>> Hi,
>>
>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
>>
>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> video-fw-qcm6490-update
>>
>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
>>
>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
>> +0530)
> 
> From the commit log:
> 
>> Fix the firmware binary name to reflect the correct sectool being used
>> for signing. Also update the version to add some recent fixes.
> 
> Using different sectoosl isn't a determining factor. It's the security
> profile and thus different MBN header versions.
> 
> However, why is it important here? We have added vpu30_p4_s6 for the
> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> v7). Do we have such an issue with vpu20_p1_gen2?

its the same case here, qcm6490 also required MBN header v6.

> 
> Last, but not least, is this firmware used at all? The venus driver uses
> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.

its used here
https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423

> 
>>
>> ----------------------------------------------------------------
>> Dikshita Agarwal (1):
>>       qcom: vpu: fix the firmware binary name for qcm6490
>>
>>  WHENCE                                               |   4 ++--
>>  qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} | Bin 2036328 ->
> 
> It should be vpu20_p1_gen2_s6 then.

Ok.

> 
>> 2031844 bytes
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>  rename qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} (73%)
>>
>>
>> Thanks,
>> Dikshita
> 
