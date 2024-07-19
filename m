Return-Path: <SRS0=0Fqo=OT=quicinc.com=quic_vgarodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FA2C3DA5D
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jul 2024 06:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B686C4AF0A; Fri, 19 Jul 2024 06:46:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31E96C32782
	for <linux-firmware@kernel.org>; Fri, 19 Jul 2024 06:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31E96C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J0x0oS016790;
	Fri, 19 Jul 2024 06:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IQE0m9LfwWTLq9viEKntjk4F/HPaP114MZV0wVXjug=; b=oFvs6V1q8uZUreyR
	O3hB6/L0vJlCLakaWVKSlVYmmXO2uNtkr/5y17N3fUHEfrlv9DqMsFn0lW2jpIVe
	RvN5wiTZULr+i3saofxZ9n4G+TbfMuU7wMjCA5GdzLCwtnGaYLAmzTHPKfE6UM3S
	0IBti7N+K+XRhl9UhNUDNpVg5ZmDtWhLa5A41c3c2R/g3SEuUNG3eUy4pAIZ1hVP
	y07+YtT6IRC7inAXU0kes4T7Ehdlqv79tw4u4ZnANv7pW5DOzxDMfGf3EsLpnr4S
	NI9CyLeCt06aBYnQdSwtWf8X1Txf1zRn4UBRxMUEq9GJGHkXhJ7mmYSUP6E3Hjx0
	33pyZw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe33gjhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 06:46:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46J6kFU1008627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 06:46:15 GMT
Received: from [10.216.6.122] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 23:46:13 -0700
Message-ID: <b99c3806-b3f0-d73c-2338-2e98de52132c@quicinc.com>
Date: Fri, 19 Jul 2024 12:16:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] qcom: update path for video firmware for vpu-3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>
References: <1721300902-24242-1-git-send-email-quic_dikshita@quicinc.com>
 <CAA8EJpo4OijebJ9n3TONnB+huT3+VkZEE9LCHETV8iWAYZXsdQ@mail.gmail.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <CAA8EJpo4OijebJ9n3TONnB+huT3+VkZEE9LCHETV8iWAYZXsdQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yapkz2IZyx1eSjUrYoxlCYN9bmLfeY_j
X-Proofpoint-GUID: Yapkz2IZyx1eSjUrYoxlCYN9bmLfeY_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_03,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407190051



On 7/18/2024 5:07 PM, Dmitry Baryshkov wrote:
> On Thu, 18 Jul 2024 at 14:10, Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
>>
>> - Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
>>   new firmware files.
>> - Create symlinks for firmware files for vpu-1.0 and vpu-2.0 in
>>   the same sub-folder.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  WHENCE                    |   2 +-
>>  qcom/vpu-3.0/vpu30_4v.mbn | Bin 2306664 -> 0 bytes
>>  qcom/vpu/vpu10_4v.mbn     |   1 +
>>  qcom/vpu/vpu20_4v.mbn     |   1 +
>>  qcom/vpu/vpu30_4v.mbn     | Bin 0 -> 2306664 bytes
> 
> Ok. You know that a single instance of the file had troubles getting
> through. Now you are sending it twice when it's not required at all.
> 
> Please fix your setup so that git diff / git format-patch shows
> renames are renames, not as an remove-and-add pair. Git does that
> _by_default_, so it's something in your setup that changed this.
> Please revert to the default behaviour.
> 
> This is how it looks by default:
> 
> diff --git a/qcom/vpu-3.0/vpu30_4v.mbn b/qcom/vpu/vpu30_4v.mbn
> similarity index 100%
> rename from qcom/vpu-3.0/vpu30_4v.mbn
> rename to qcom/vpu/vpu30_4v.mbn
> 
> Also please consider using GitLab MRs or pull requests instead of
> sending huge emails with multi-megabyte binary patches. It's all
> described in README.md. And I think it should have been added to
> Qualcomm internal documentation on upstraming.
I agree MR/PR is the right way to do it for larger binaries, in that case,
should the README.md be updated to keep the approach limited to MR/PR ? I see
the approach to send the bins as email is also mentioned as one of the approach.

Regards,
Vikash
> 
>>  5 files changed, 3 insertions(+), 1 deletion(-)
>>  delete mode 100644 qcom/vpu-3.0/vpu30_4v.mbn
>>  create mode 120000 qcom/vpu/vpu10_4v.mbn
>>  create mode 120000 qcom/vpu/vpu20_4v.mbn
> 
> Please move files to the new location and provide backwards-compatible
> links rather than doing that backwards and providing
> forward-compatible links instead.
> Also please use Link: tag in WHENCE instead of creating symlinks manually.
> 
>>  create mode 100644 qcom/vpu/vpu30_4v.mbn
>>
>> diff --git a/WHENCE b/WHENCE
>> index 5e91462..876f562 100644
>> --- a/WHENCE
>> +++ b/WHENCE
>> @@ -5942,7 +5942,7 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
>>
>>  Driver: iris - Qualcomm Iris video codec accelerator
>>
>> -File: qcom/vpu-3.0/vpu30_4v.mbn
>> +File: qcom/vpu/vpu30_4v.mbn
>>
>>  Version: VIDEO.VPU.3.1-0076
>>
> 
> [skipped two instances of vpu30_4v.mbn]
> 
>> diff --git a/qcom/vpu/vpu20_4v.mbn b/qcom/vpu/vpu20_4v.mbn
>> new file mode 120000
>> index 0000000..56cdfe6
>> --- /dev/null
>> +++ b/qcom/vpu/vpu20_4v.mbn
>> @@ -0,0 +1 @@
>> +../vpu-2.0/venus.mbn
>> \ No newline at end of file
> 
> 
> 
> --
> With best wishes
> Dmitry
