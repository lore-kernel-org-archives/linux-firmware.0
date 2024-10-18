Return-Path: <SRS0=6wfs=RO=quicinc.com=quic_sibis@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A103D30011
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Oct 2024 15:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 700D2C4CEC5; Fri, 18 Oct 2024 15:29:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30842C4CEC3
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 15:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30842C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IDBcZE017451;
	Fri, 18 Oct 2024 15:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IhFxJN0TTiHxI/Z+XgKvX720nxuXES4jUCJ0Tp4NJc=; b=J2eHxaU6we5eqEOK
	WlXcv/OCHqaM4MSvHbDObr8KclwSIVmkdKZNQh3/wGjX846q9bmIpb+DqS5cXDBS
	MUIIhH1F++lWuc5IOB/aLTTsceCVRwiRyNhlFUvnnMIlgooULhTfrNza8TjrQGfS
	rFByUeZvl1mNlTr4PTsPAc89EA/ESgkLVzy3pf3f180dz0C0HUsT/2lreV2cWmAr
	tQMjG0S4a5TNkozoRZd4JdJHKkOD/jkI+IVdHOq+F5WIgMT4WKI1xEvWlhpWzpiN
	aXC0OOjQxRiIVogn2j5EBv1EhiBYGhhLSCA6P3mm2eluv/LXwB0eONGzHNqNGxK0
	NptDIA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bh3p9vsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 15:29:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IFTOM8018290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 15:29:24 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 08:28:51 -0700
Message-ID: <d169bd29-b756-f027-9f33-02106b702359@quicinc.com>
Date: Fri, 18 Oct 2024 20:58:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <abickett@quicinc.com>
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
 <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
Content-Language: en-US
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1M78eNpWAE_3yYvtELtdS2AdRRmXFyiL
X-Proofpoint-ORIG-GUID: 1M78eNpWAE_3yYvtELtdS2AdRRmXFyiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=629
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180099



On 10/18/24 16:13, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
>>
>> Hello,
>>
>> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
>>
>>    Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> adsp-fw-x1e80100-crd
> 
> Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> Windows firmware has it in adspr.jsn.

Hey Dmitry,

Can you please share what device and META you are comparing this
firmware against? This firmware was taken from the build source
without any modification.

-Sibi

> 
>>
>> for you to fetch changes up to e1ebc2c9b9956f4115853c9feb07c56957503418:
>>
>>    qcom: Add Audio firmware for X1E80100 CRD/QCPs (2024-10-18 11:48:47 +0530)
>>
>> ----------------------------------------------------------------
>> Sibi Sankar (1):
>>        qcom: Add Audio firmware for X1E80100 CRD/QCPs
>>
>>   WHENCE                     |   7 +++++++
>>   qcom/x1e80100/adsp.mbn     | Bin 0 -> 22235528 bytes
>>   qcom/x1e80100/adsp_dtb.mbn | Bin 0 -> 73528 bytes
>>   qcom/x1e80100/adspr.jsn    |  22 ++++++++++++++++++++++
>>   qcom/x1e80100/adsps.jsn    |  22 ++++++++++++++++++++++
>>   qcom/x1e80100/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>>   qcom/x1e80100/battmgr.jsn  |  22 ++++++++++++++++++++++
>>   7 files changed, 102 insertions(+)
>>   create mode 100644 qcom/x1e80100/adsp.mbn
>>   create mode 100644 qcom/x1e80100/adsp_dtb.mbn
>>   create mode 100644 qcom/x1e80100/adspr.jsn
>>   create mode 100644 qcom/x1e80100/adsps.jsn
>>   create mode 100644 qcom/x1e80100/adspua.jsn
>>   create mode 100644 qcom/x1e80100/battmgr.jsn
>>
>> Thanks,
>> Sibi Sankar
> 
