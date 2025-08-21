Return-Path: <SRS0=xTUk=3B=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE6CCA0EF8
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Aug 2025 08:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C2E2C116C6; Thu, 21 Aug 2025 08:41:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43037C116B1
	for <linux-firmware@kernel.org>; Thu, 21 Aug 2025 08:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43037C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L6bslE032544;
	Thu, 21 Aug 2025 08:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zxjwu3meFYAs/3N9mSBZfqBop5mRFYbfe14soduA/oo=; b=TBfDKi4MTxpNYJHd
	d+VgLsIpGQOlJAhocqmNen3oTvP+ffu0NyiP9mBmtV3mFFTaRyf/5Zg2qpe1XJBy
	khXqksRINvc1IexJ7SKWwl+FKR5wwyOupMURgsbyJlQg7wD1HG4kIq/aTykkM5a1
	C8meT1i6LAsRFnLW/seo1oDpyxkJeTI/Y5UGiWK3jzP5cYbUXlEc68Nfbr2PKmUh
	iEyO6qv820RL2cdrZa9lmqpzmkaLEiZu/IdjfpA3CceAPTwZXJGi6/aFgVhp9yFN
	N9WtSA3tmtIgKoGAVkeenl4tqIsP63uUAWnzEstFE13a2qBa2H4FxH0qp39nbugu
	GP4x+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8ahxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 08:41:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57L8fKMv030042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 08:41:20 GMT
Received: from [10.50.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 01:41:19 -0700
Message-ID: <f3f6f8e0-f7e2-3f4c-8277-4985adbd7ed4@quicinc.com>
Date: Thu, 21 Aug 2025 14:11:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Add firmware binary for SM8650
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <2ed59e7f-c8e9-7c29-b1e8-d85058a022b9@quicinc.com>
 <mwa37ubagjrmxlh7etjwlxsacrt5c455fn2no3gp6vjavnaner@gc7jwulrgen2>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <mwa37ubagjrmxlh7etjwlxsacrt5c455fn2no3gp6vjavnaner@gc7jwulrgen2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX59D2UilatF+0
 4qi/lEwdzdW7Bskp+Awl/HfiU95S+TvEu788TP5HZddzm8H/CHAQFZgY/Bqisgblr8gaJjksQls
 YL/H5CQou+1+9ELh2C4FvJm6ngymcI7avXhFBxRihGd9yPKX6KkATPzIp9mRUGH0es4LHjJ/NPU
 174DHmsiMChbqZ3pCC6+vHNfB0wSzMGRF+oiQEy2VQe9X4FQam181rM5VyzPR3uZC5ddvk7zXsw
 2vB7MmY/1mTonOsG/jTzmFt/kEr/K9qTj1e/6PcdfZrDbNM5yGH9lojoHXICZlZTyyt+pgqzgL9
 pIO2sD8hPFN/YiWnTa65l3cfFpfoQHrFUWH8/vpWEj15duiWzjcml8MLdWULKDlbJbapK2UQewD
 Qm8Z3+YEGbNz6cswvhv47kAPedbIYw==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a6dbb1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8
 a=O-mWUHQKgJtq8B6DbjcA:9 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: aktM4kyfqxXpVuJA_YgWs-HcmsYQK1aF
X-Proofpoint-ORIG-GUID: aktM4kyfqxXpVuJA_YgWs-HcmsYQK1aF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134



On 8/20/2025 5:34 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:24:44PM +0530, Dikshita Agarwal wrote:
>> Hi,
>>
>> The following changes since commit 697065607ca2e09fe02b0d6c7c2bf7bcc96243a5:
>>
>>   Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> video-fw-SM8650
>>
>> for you to fetch changes up to ece445af91bbee49bf0d8b23c2b99b596ae6eac7:
>>
>>   qcom: Add firmware binary for SM8650. (2025-08-20 17:23:16 +0530)
> 
> Could you please make sure that VPU firmware list is sorted in the
> WHENCE file? I should have cought it earlier...

Sure, the current change is merged, I can raise a separate change to fix
the order of all firmwares.

Thanks,
Dikshita
> 
>>
>> ----------------------------------------------------------------
>> Dikshita Agarwal (1):
>>       qcom: Add firmware binary for SM8650.
>>
>>  WHENCE                |   4 ++++
>>  qcom/vpu/vpu33_p4.mbn | Bin 0 -> 2343624 bytes
>>  2 files changed, 4 insertions(+)
>>  create mode 100644 qcom/vpu/vpu33_p4.mbn
>>
>>
>>
>> Thanks,
>> Dikshita
> 
