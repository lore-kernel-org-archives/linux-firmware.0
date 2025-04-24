Return-Path: <SRS0=D5jh=XK=quicinc.com=quic_vgarodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B809C369C2
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Apr 2025 12:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 856ECC4CEE8; Thu, 24 Apr 2025 12:00:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1534CC4CEE3
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 12:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1534CC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBodhI007489
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 12:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9J1wKB+jwOSarTRLlin//1BXLlZcY9jLeqJXCao+o8=; b=Ae7AKZpd9XyGJ6SG
	XLpYNjORsHrmcTKghmZiCjZDOlHfKCgd+kZ0jf9FjNBWwfpeKbBpvAMCjutlvgQu
	QcPXUJefZTZ928/+MPm9hokLIv9GA1ElxZia1TKoL5LlNn+YNaifgNwsENUmEQmG
	ORpIC6H3gIFl9vxkY+aObydnOWqsr43zCu1gzRwlySm0RGO63OfDjihuSATX1o7b
	ubGSLqPy3YwpQdZFTRu7DdCZzlYog2L/LH3puZUlXcnXuVk8eRC9IzyIJZW953rB
	PXbTrEOv8Qrh4cpfHc9tYHgHUk8bZwBNiQD1smCyrS3TsOJNcsbHj5ROyrZ+Jhb1
	1hT75g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ne02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 12:00:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OC0fSr012511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 12:00:41 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 05:00:40 -0700
Message-ID: <5e296369-0960-680a-ca35-916e3b733d4d@quicinc.com>
Date: Thu, 24 Apr 2025 17:30:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: update video firmware binary for SA8775p
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>, <linux-firmware@kernel.org>
References: <798a8c89-d977-603f-43a6-ea836d3f459f@quicinc.com>
 <toxomfkw6v2cb4fys5s73tzahccfpxqsxp2hjt2r3xkge5qc5e@bgqtxusxvynl>
 <222a5475-c63e-44de-f9da-4a993a70623b@quicinc.com>
 <6xt3dmrd6z26na7e5kqro5ws3ulbm4wop2k7wl5wt3m2fr4rql@barhdtegzw5s>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <6xt3dmrd6z26na7e5kqro5ws3ulbm4wop2k7wl5wt3m2fr4rql@barhdtegzw5s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ace-5MctD8SksTwYm8GxuO4FAgp7Yb-J
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a27ee cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=F93HAdF0rOmuIVV6ywIA:9 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: ace-5MctD8SksTwYm8GxuO4FAgp7Yb-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MSBTYWx0ZWRfXzspJxd7m2LL9 a39KCauw3q9FoKSEHrgwQ7SK8fL19PP0QtFVnhLEofRdIRFYdJ6WXZevP+Ex8W0fsLIEP+IZ39h 1VfkiA/nCoqnduRCmCAjlGr4UTNGixcX+1q/VsdOdHBEF+XtTd+5YjzOd0ahHW6gB5Q4wACAksw
 c6OuszSH7KYyYQIqR8UsJ/xs4OXLWvLVN8//YUDx/0s9VNjB4JYaNvI4xYWahBlhGT32QrBOqTO +aDMzMV+PQGCDDNlMEmOA3rDj7ka0ol3y/2X1MxiXJAZJwFTTNBN7GeyVzOcszDKR2nPZ1dNzzZ rYVuIeJxEzsteO34nlWou4jlYvDztz7yg/7Cs4Pti6R0BOX6fIHPBXvYDUTS4J9OorOJZdZ77I2
 Jh5dL/YIEeFf8sPr8aTffQX5i5ghgn4OsAmWLhUwvjRXq2Qv7klrJ2N4wSO/2HWFD0al99Rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=596 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240081


On 4/24/2025 4:48 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 24, 2025 at 04:25:06PM +0530, Vikash Garodia wrote:
>>
>> On 4/24/2025 4:13 PM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 24, 2025 at 03:48:24PM +0530, Dikshita Agarwal wrote:
>>>> Hi,
>>>>
>>>> The following changes since commit c67433231cbd8bcf90b5563bed22fc7a62bbc2bc:
>>>>
>>>>   Merge branch 'robot/pr-0-1745441634' into 'main' (2025-04-23 23:24:26 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> video-fw-SA8775p-16MB
>>>>
>>>> for you to fetch changes up to ef226c72835b1f8521e855f5a12640b8991d1ef1:
>>>>
>>>>   qcom: vpu: update video firmware binary for SA8775p (2025-04-24 15:07:18
>>>> +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Dikshita Agarwal (1):
>>>>       qcom: vpu: update video firmware binary for SA8775p
>>>>
>>>> WHENCE                        |   4 ++++
>>>> qcom/vpu/vpu30_p4_s6_16mb.mbn | Bin 0 -> 2311988 bytes
>>>> 2 files changed, 4 insertions(+)
>>>> create mode 100644 qcom/vpu/vpu30_p4_s6_16mb.mbn
>>>
>>> How this is going to be used / selected?
>> Once the board memory map is updated to have video PIL region as 16MB, video
>> driver would switch the firmware for that board to vpu30_p4_s6_16mb.mbn.
> 
> So, by changing the DT to point either to the old one or to the new
> file?
Thats right
