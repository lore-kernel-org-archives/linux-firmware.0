Return-Path: <SRS0=ldPE=UO=quicinc.com=quic_chejiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3FEC02182
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Jan 2025 10:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D989C4CEE7; Wed, 22 Jan 2025 10:39:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E203AC4CED6;
	Wed, 22 Jan 2025 10:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E203AC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4Z4UZ019857;
	Wed, 22 Jan 2025 10:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AYlVL+YBGLomVOAvI+vHOYx2Fl6oTqM3ABeOcieW5o=; b=DqVvrKLkv43nQEGG
	m6VOchCpL3BOD7QzaLtRcoesbEO3fOi22StHYVrKZ5CX3Qsv3OLGF+prIrO3ytYR
	IVncPbP9s/YFD8zXQm46ESC7ZRL2hWj0i9UhRNwiZCwaf7Ccj0jnvlMAtnMDmXmp
	C2ft654Vf5tW924whkaEZCVqfo4l90K2fk49FddBSP0E6ILu1zHamdBd8bYoVe66
	/x5crawr8vjT/6xHBvdWEStE/M7NYlyuVf27+yuI1iNBh0xyLjMGNG5Id+pJ6nIC
	ulNT12/fTltEpcAx/wQ2+r+u6+DzfAqu7RKK5F4J931elRX75vW1ZpKTnS8XO6Kw
	8z73SA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ass6gu28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:39:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MAdJrU009198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:39:19 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 02:39:17 -0800
Message-ID: <defe5429-98cd-467e-86bb-3e848db19098@quicinc.com>
Date: Wed, 22 Jan 2025 18:39:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add Bluetooth firmware for QCA6698 request-pull
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
References: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
 <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub>
 <d954eb99-cdb7-4308-a677-aaf5a14feed4@quicinc.com>
 <CAA8EJppnBK7oqsnV8evEBpBmUbSwX3itjWjFpUYfg7_gX642cw@mail.gmail.com>
 <301f6627-fb10-4b24-927e-32b6e2646516@quicinc.com>
 <vjxdrqynnxdqkr5efmi2qyxowbv3bs6xsmt55mzgfyydze2mmt@xtevzhgq6z4g>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <vjxdrqynnxdqkr5efmi2qyxowbv3bs6xsmt55mzgfyydze2mmt@xtevzhgq6z4g>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -OWiDi1eSK8hm67iG4cwooOdB-YxWAlD
X-Proofpoint-ORIG-GUID: -OWiDi1eSK8hm67iG4cwooOdB-YxWAlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220078

Hi Dmitry.

On 1/22/2025 8:53 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 22, 2025 at 08:46:43AM +0800, Cheng Jiang wrote:
>>
>>
>> On 1/21/2025 4:07 PM, Dmitry Baryshkov wrote:
>>> On Tue, 21 Jan 2025 at 04:39, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>>>>
>>>> Hi Dmitry,
>>>>
>>>> On 1/20/2025 5:34 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wrote:
>>>>>> Hi linux-firmware maintainers,
>>>>>>
>>>>>> Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
>>>>>>
>>>>>> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
>>>>>>
>>>>>>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
>>>>>>
>>>>>> are available in the git repository at:
>>>>>>
>>>>>>   https://github.com/che-jiang/qca_btfw
>>>>>>
>>>>>> for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
>>>>>>
>>>>>>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>>  Cheng Jiang (1):
>>>>>>
>>>>>>     QCA: Add Bluetooth firmware for QCA6698
>>>>>>
>>>>>>     This commit will add required Bluetooth firmware files for QCA6698
>>>>>>     The image version is 2.1.2-00035.
>>>>>
>>>>> Please confirm whether these files should be using LICENSE.qcom or
>>>>> LICENSE.QualcommAtheros_ath10k?
>>>> Thank you for review this, it should be LICENSE.qcom.
>>>>>
>>>>> Also please include into the commit message an explanation that was
>>>>> shared together with the kernel patches so that nobody is surprised by
>>>>> the subdir and the firmware names.
>>>> Ack.
>>>>>
>>>>>
>>>>>>
>>>>>>     hpbtfw21.tlv : RAM FW dump
>>>>>>     hpnv21.b206  : NVM dump
>>>>>>     hpnv21.b207  : NVM dump
>>>>>
>>>>> Which platforms are these two files for?
>>>> Currently there are two connectivity boards using QCA6698, the board id
>>>> are 206 and 207 respectively. So add two board specific nvm files here.
>>>
>>> Connectivity boards for ... ?
>>>
>> Connectivity boards for sa8775p-ride platform. Here is the dts changes. 
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20250110063914.28001-2-quic_chejiang@quicinc.com/
> 
> Commit message, please.
> 
Ack.
Here is the new commit id a55049bb0691bc5c0f800a0a32ab0445f5de9b8e on
https://github.com/che-jiang/qca_btfw  
Could you please help to review? Thanks! 

>>
>> And the driver changes:
>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=8c6fb157eb03
>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=ad3f4635a796
>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=be6ff38d6852
>>
>>
>>>>>
>>>>>>     hpnv21.bin   : NVM dump
>>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 

