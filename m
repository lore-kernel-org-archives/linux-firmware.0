Return-Path: <SRS0=buff=SJ=quicinc.com=quic_vgarodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A71D637DC
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Nov 2024 03:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 375F9C4CED0; Thu, 14 Nov 2024 03:37:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A91AC4CEC3
	for <linux-firmware@kernel.org>; Thu, 14 Nov 2024 03:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A91AC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADH1YwG026972;
	Thu, 14 Nov 2024 03:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1LjUychCbwPmv+swHl1UfFoZoyFa+6udUNIHFqzDHZ0=; b=Afqf/sG97dJGPZA1
	hKcaVbSZ1ny9kOKa1InZQ1UhVZ0OrIwt51+hco1sZynXn6y5Wp8qLsyyfq1MqboP
	2ZbwWAScqV3IHCRrCgDYr6boCLfFKBZGRghW8BCQIjRaaDJY9IRkp8FoYOH6+H5H
	nrzI/tKXmz609oy14VcdGdus4SOGI99DxTZiARYvr6B9yC25eiDRbL6/gFKjZT8q
	7pXVTFsBbDtj9pA+njDXb7gq/TQAq5wcUu9IuV/vPK8edJ8dQ9Hn9LnbS586u7J6
	T+7N0gCq3LpGoSmp7d9z1/ADf7J1gwthMkriJSNFwB+Z0X7jsTV3W8altnnUW1aL
	KS/SMQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vt732fs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 03:37:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE3b2uZ011923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 03:37:02 GMT
Received: from [10.216.8.68] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 19:36:59 -0800
Message-ID: <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
Date: Thu, 14 Nov 2024 09:06:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: add venus firmware file for qcs615
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _NVCQ_p5BPdR2-SBRAcxnxD2k56Y70M9
X-Proofpoint-GUID: _NVCQ_p5BPdR2-SBRAcxnxD2k56Y70M9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140025


On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
>> Hello
>>
>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
>>
>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>>
>> are available in the Git repository at:
>>
>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
>>
>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
>>
>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
>>
>> ----------------------------------------------------------------
>> Renjiang Han (1):
>>       qcom: venus-5.4: add venus firmware file for qcs615
>>
>> WHENCE                      |   1 +
> 
> Could you please be more specific, what is the difference between the
> existing file and a new file? According to the soc_vers the new file
> supports sdm845. Should it instead replace the old firmware?
SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
different signing for qcs615, it takes a separate bin (xxx_s6.mbn).

Regards,
Vikash
> 
>> qcom/venus-5.4/venus_s6.mbn | Bin 0 -> 922240 bytes
>> 2 files changed, 1 insertion(+)
>> create mode 100644 qcom/venus-5.4/venus_s6.mbn
>>
>> Best Regards,
>> Renjiang
> 
