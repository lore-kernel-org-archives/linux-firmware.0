Return-Path: <SRS0=0JVC=UP=quicinc.com=quic_chejiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F294C0218C
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Jan 2025 00:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C79B2C4CEE1; Thu, 23 Jan 2025 00:22:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 939F9C4CED2;
	Thu, 23 Jan 2025 00:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 939F9C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MMxgni000300;
	Thu, 23 Jan 2025 00:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BrJT3sS8wh8/cFvcSEhW6HKRJdS98cyniC4vgY+4K8Y=; b=TnCUlN4sT/Cz+PD8
	NPT9o9XRNmpawJD9LwIQEVo66TlbDoLMkRq7VgXwPvYbTbJvqHoKSws/FOP8TqqN
	ESc4HjpJeEvHIEQUl3awr3HdCpdZgdywHYGXICSIL6UvnMzItuUzx3zHgfHZuF9a
	PNXK9URRP5y2nmlfQ4P0KQe2GKu4TMCMewTxOTlgAQBH7ziFZT+J59Jw7/gvuEAf
	djFvSg7rcb58VuRi7rt5Nh4uJf4pQf98nD4Ve5+8xGlff0suo+41i95Ilff1UOHU
	Rwa1I4Vt47W1PbkgstorkK+pljb+FoGkvkHYlnw8SuLt7CXkVSj6FRGSoJgsDTFa
	DclbOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44b9xq047a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 00:22:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50N0MYKd019866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 00:22:34 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 16:22:33 -0800
Message-ID: <0434d052-83f2-40f6-8e10-d6171458dd03@quicinc.com>
Date: Thu, 23 Jan 2025 08:22:30 +0800
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
 <defe5429-98cd-467e-86bb-3e848db19098@quicinc.com>
 <375wp6vzjho3eu3guzjxajixvmumop5e3m6aqhgpgrqkxr4lhx@tsoarhsqmcan>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <375wp6vzjho3eu3guzjxajixvmumop5e3m6aqhgpgrqkxr4lhx@tsoarhsqmcan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a1hYOtqK4TIjkzpqc0WBkT-kINPJnay0
X-Proofpoint-ORIG-GUID: a1hYOtqK4TIjkzpqc0WBkT-kINPJnay0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_11,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230000

Hi Dmitry,

On 1/23/2025 2:50 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 22, 2025 at 06:39:15PM +0800, Cheng Jiang wrote:
>> Hi Dmitry.
>>
>> On 1/22/2025 8:53 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 22, 2025 at 08:46:43AM +0800, Cheng Jiang wrote:
>>>>
>>>>
>>>> On 1/21/2025 4:07 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 21 Jan 2025 at 04:39, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>>>>>>
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> On 1/20/2025 5:34 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wrote:
>>>>>>>> Hi linux-firmware maintainers,
>>>>>>>>
>>>>>>>> Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
>>>>>>>>
>>>>>>>> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
>>>>>>>>
>>>>>>>>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
>>>>>>>>
>>>>>>>> are available in the git repository at:
>>>>>>>>
>>>>>>>>   https://github.com/che-jiang/qca_btfw
>>>>>>>>
>>>>>>>> for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
>>>>>>>>
>>>>>>>>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
>>>>>>>>
>>>>>>>> ----------------------------------------------------------------
>>>>>>>>  Cheng Jiang (1):
>>>>>>>>
>>>>>>>>     QCA: Add Bluetooth firmware for QCA6698
>>>>>>>>
>>>>>>>>     This commit will add required Bluetooth firmware files for QCA6698
>>>>>>>>     The image version is 2.1.2-00035.
>>>>>>>
>>>>>>> Please confirm whether these files should be using LICENSE.qcom or
>>>>>>> LICENSE.QualcommAtheros_ath10k?
>>>>>> Thank you for review this, it should be LICENSE.qcom.
>>>>>>>
>>>>>>> Also please include into the commit message an explanation that was
>>>>>>> shared together with the kernel patches so that nobody is surprised by
>>>>>>> the subdir and the firmware names.
>>>>>> Ack.
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>     hpbtfw21.tlv : RAM FW dump
>>>>>>>>     hpnv21.b206  : NVM dump
>>>>>>>>     hpnv21.b207  : NVM dump
>>>>>>>
>>>>>>> Which platforms are these two files for?
>>>>>> Currently there are two connectivity boards using QCA6698, the board id
>>>>>> are 206 and 207 respectively. So add two board specific nvm files here.
>>>>>
>>>>> Connectivity boards for ... ?
>>>>>
>>>> Connectivity boards for sa8775p-ride platform. Here is the dts changes. 
>>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20250110063914.28001-2-quic_chejiang@quicinc.com/
>>>
>>> Commit message, please.
>>>
>> Ack.
>> Here is the new commit id a55049bb0691bc5c0f800a0a32ab0445f5de9b8e on
>> https://github.com/che-jiang/qca_btfw  
>> Could you please help to review? Thanks! 
> 
> I'd drop the DTS link. Looks good to me otherwise.
> 
Thank you! I updated the commit message in 52e961830b8eb7c7c7c36adbaac32fef71726251.
>>
>>>>
>>>> And the driver changes:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=8c6fb157eb03
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=ad3f4635a796
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=be6ff38d6852
>>>>
>>>>
>>>>>>>
>>>>>>>>     hpnv21.bin   : NVM dump
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>
> 

