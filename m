Return-Path: <SRS0=E6pF=TK=quicinc.com=quic_dikshita@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3AEE7717F
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 10:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 807F4C4CED4; Tue, 17 Dec 2024 10:57:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 832DCC4CED3
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 10:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 832DCC4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4m7D0014512;
	Tue, 17 Dec 2024 10:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imubX8zMf2JBX8zHetkDFN7RgUvpI8TBj3J/qsREsE0=; b=IuR68DBkypse/o8S
	/fWjr7BZoyzr6BQvCU3SJYtY4xMgjpVaf4exSZ6IoZVYAiFb2hxYEHfy4J/KhEvZ
	Qgc4Fx3so69VPMkpOEEA6Xh0vKusOsLXjslzP1eX9MX4jPhXNcHBAGkwCidiKVbn
	LDl8R+2I/940dL/HRO+Kv6hHydFZNI11GMDeWKH8VGTbR0yf8NumZPI3f9jNqZ0E
	jsTaFw2GmZcZkkbytImBydowsioxn5ocEf4PFcisc25YOm2MScw200ons7BIuiJd
	L/XsVuCniJ8R0zNgmUI82HWkK6AlEi4+xxeTRLXUseKjgCrku8dfJ687CPfUDbnE
	JqxMqA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2k7gxj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:57:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHAveXH015636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:57:40 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 02:57:39 -0800
Message-ID: <bb1b636d-8b17-6061-ecc1-8568bbd9e9bc@quicinc.com>
Date: Tue, 17 Dec 2024 16:27:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: update firmware binary for sc7180 and qcs615
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>
References: <6e0ae91f-7233-ca54-953e-734a71d76e22@quicinc.com>
 <CAA8EJppvAPmneYtixMhACf7NJdOX837UFuFdVCzbzBDMOSDR0Q@mail.gmail.com>
 <f2867d67-8b89-fcff-80c2-3de46806a590@quicinc.com>
 <CAA8EJpo+6r61Fcu-jzjdcrT6ifkmTHua5sdsuDpfZwZuo=JEBA@mail.gmail.com>
 <0a0ca412-bbf3-8411-5de1-155098b1811f@quicinc.com>
In-Reply-To: <0a0ca412-bbf3-8411-5de1-155098b1811f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x0y66wMkOkrhG3wVMF9itwAzEF6Of_E6
X-Proofpoint-GUID: x0y66wMkOkrhG3wVMF9itwAzEF6Of_E6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=631 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170090

Hi Josh,

Here is the updated pull request. please let me know if a new mail is
required for the same.

The following changes since commit d4033141873bbbc79c954dfcea502726ee278c5e:

  Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38:57 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-SC7180-QCS615

for you to fetch changes up to 9778d18566912efa6c811ffde4cf4432a8990e85:

  qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (2024-12-17
16:19:47 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: venus-5.4: update firmware binary for sc7180 and qcs615

 WHENCE                      |   3 +--
 qcom/venus-5.4/venus.mbn    | Bin 922240 -> 922216 bytes
 qcom/venus-5.4/venus_s6.mbn | Bin 922240 -> 0 bytes
 3 files changed, 1 insertion(+), 2 deletions(-)
 delete mode 100644 qcom/venus-5.4/venus_s6.mbn


Thanks,
Dikshita

On 12/17/2024 4:22 PM, Dikshita Agarwal wrote:
> 
> 
> On 12/17/2024 4:19 PM, Dmitry Baryshkov wrote:
>> On Tue, 17 Dec 2024 at 12:48, Dikshita Agarwal
>> <quic_dikshita@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 12/17/2024 4:12 PM, Dmitry Baryshkov wrote:
>>>> Hi Dikshita,
>>>>
>>>> On Tue, 17 Dec 2024 at 08:10, Dikshita Agarwal
>>>> <quic_dikshita@quicinc.com> wrote:
>>>>>
>>>>> Hi Josh,
>>>>>
>>>>> Please pull below change, and as discussed, skipped creating symlink for now.
>>>>
>>>> It's sad to see that this change wasn't even verified:
>>>>
>>> My Apologies for missing that.
>>>> $ make check
>>>> [...]
>>>> E: qcom/venus-5.4/venus_s6.mbn listed in WHENCE does not exist
>>>>
>>>> Not to mention that you Josh nearly asked to add the symlink in his
>>>> response: "...but you likely want to include a symlink for
>>>> venus_s6.mbn ..."
>>>> I had a discussion with Josh regarding the symlink and he agreed to skip it
>>> for now.
>>
>> Please keep such discussions in public.
> Noted.
>>
>>>
>>> Thanks,
>>> Dikshita
>>>>>
>>>>> The following changes since commit d4033141873bbbc79c954dfcea502726ee278c5e:
>>>>>
>>>>>   Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38:57 +0000)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>> video-fw-SC7180-QCS615
>>>>>
>>>>> for you to fetch changes up to 07479dbb62054d362a206e71c2e4cb52181c81d4:
>>>>>
>>>>>   qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (2024-12-17
>>>>> 11:36:00 +0530)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Dikshita Agarwal (1):
>>>>>       qcom: venus-5.4: update firmware binary for sc7180 and qcs615
>>>>>
>>>>>  WHENCE                      |   2 +-
>>>>>  qcom/venus-5.4/venus.mbn    | Bin 922240 -> 922216 bytes
>>>>>  qcom/venus-5.4/venus_s6.mbn | Bin 922240 -> 0 bytes
>>>>>  3 files changed, 1 insertion(+), 1 deletion(-)
>>>>>  delete mode 100644 qcom/venus-5.4/venus_s6.mbn
>>>>>
>>>>> Thanks,
>>>>> Dikshita
>>>>
>>>>
>>>>
>>
>>
>>
