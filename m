Return-Path: <SRS0=D5jh=XK=quicinc.com=quic_vgarodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65F4C369AB
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Apr 2025 10:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F680C4CEEC; Thu, 24 Apr 2025 10:55:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6634CC4CEEB
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6634CC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OATBYA010237
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmAuxz/SwRiwwCpxFYWYfEAdeqK91q+p5qGC7nWbfFo=; b=FEZmRxS4A8KfS41X
	IxMemQkHf0FbvcL2pvFRfnrKIHwb3TXc1jM9e4DrgRtNhP6oCGARHFEPGgPtb3Tq
	EVgVQd+5lGyh57tpuzD/imHY7leavZ6T7JuIL3ELb6my1m8l23VZOiFskko2AXts
	H1Dv9PqcNN8WFbbEbU+/qz4cc0SroGB90j7mENhqMoDyRJD8PDeXaZFnb06uHIJW
	BssmckqQXMfnZ32bOfRttCWZA1qiuAgpQvPoDf1icAqJnwakiBgZGx3yeOGb8uZi
	686JtPxE3q91SnwgrjAd2RC8Ah/F1O9YenJPdFcISQVvHnqCZq3faf0Popikz39L
	7rE6Pw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3n8h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:55:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OAtAx9018401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:55:10 GMT
Received: from [10.216.12.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 03:55:09 -0700
Message-ID: <222a5475-c63e-44de-f9da-4a993a70623b@quicinc.com>
Date: Thu, 24 Apr 2025 16:25:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: update video firmware binary for SA8775p
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>
References: <798a8c89-d977-603f-43a6-ea836d3f459f@quicinc.com>
 <toxomfkw6v2cb4fys5s73tzahccfpxqsxp2hjt2r3xkge5qc5e@bgqtxusxvynl>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <toxomfkw6v2cb4fys5s73tzahccfpxqsxp2hjt2r3xkge5qc5e@bgqtxusxvynl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TqYbT_sV3t8pFO2v4QQJN12CptLxuQvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3MiBTYWx0ZWRfX3MhIrJ5h3830 29+BpM4IKus0tLHtSmLG2YpvrhIb6TAKa0Cy6iGzRHkEKv86pJ06eH2H0JsuGp5pWWr7PPCc3pl Sku3jVazqYWIq+i46kux8yEUhvLXN2cWiAJY6Bw4civWKh3auGN5ci5cODhbAp9JBv42Zbas1rl
 KOoEJeTGfk1Zv4Xq2FgqvQRd51Wu+6DEqdM2712hkaARAH/bg5YeUx8599v/rfRc5JyEoSrsgpm 49EeqIfaVlUCft+bTyTnZ57zVxoqYFAC7Tss+AXzJ2EvaVQiPFkN3mDwrMNFpc1uotX0dKu/T14 lwzJL/xdaU5a4WtZbwmG6uRtWsa6POpFxsKYU3VfMkGhJiaI65Swu68o1aK6zTrIzUv0KrLcqFQ
 4AHKSlGz1PB5WSRMDX24wKhZAK1bfuRyURbIwfcoTu/n7SaPxYB1jvrS0zXHLYEd3J2oW0Vj
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a188f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=q8Kupwl_hsWDTsDwxQMA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: TqYbT_sV3t8pFO2v4QQJN12CptLxuQvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=646 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240072


On 4/24/2025 4:13 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 24, 2025 at 03:48:24PM +0530, Dikshita Agarwal wrote:
>> Hi,
>>
>> The following changes since commit c67433231cbd8bcf90b5563bed22fc7a62bbc2bc:
>>
>>   Merge branch 'robot/pr-0-1745441634' into 'main' (2025-04-23 23:24:26 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> video-fw-SA8775p-16MB
>>
>> for you to fetch changes up to ef226c72835b1f8521e855f5a12640b8991d1ef1:
>>
>>   qcom: vpu: update video firmware binary for SA8775p (2025-04-24 15:07:18
>> +0530)
>>
>> ----------------------------------------------------------------
>> Dikshita Agarwal (1):
>>       qcom: vpu: update video firmware binary for SA8775p
>>
>> WHENCE                        |   4 ++++
>> qcom/vpu/vpu30_p4_s6_16mb.mbn | Bin 0 -> 2311988 bytes
>> 2 files changed, 4 insertions(+)
>> create mode 100644 qcom/vpu/vpu30_p4_s6_16mb.mbn
> 
> How this is going to be used / selected?
Once the board memory map is updated to have video PIL region as 16MB, video
driver would switch the firmware for that board to vpu30_p4_s6_16mb.mbn.

Regards,
Vikash


