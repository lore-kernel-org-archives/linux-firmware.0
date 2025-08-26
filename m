Return-Path: <SRS0=6A7/=3G=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA39ECA0EFA
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Aug 2025 03:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2D79C116B1; Tue, 26 Aug 2025 03:21:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9405CC4CEF1
	for <linux-firmware@kernel.org>; Tue, 26 Aug 2025 03:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9405CC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGiiBd017815
	for <linux-firmware@kernel.org>; Tue, 26 Aug 2025 03:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1nLzkhhZ6Dc7MLNwsdj/bm+l8lMX4Twlmog9NMJTic=; b=D7FBLuinVZK03b6g
	25zyvxRvVmZtAtw1Emvhtkw0Myqf92BQYeiw85pzF1PZKYYjCDxDf/DXdpvwwdTh
	g27D6e3hccMdz4UUltQaS6R8tLb/h0NwAC5OHdT5tL1TFNfVrzi0E4p0qEnxwR0I
	sFTkw27IeoG9mAir1+ccmKNEHhm1ecxlZtjWJEmKlJlKirkW/m1hzJeic6qJTQEm
	WqaMYshHNEaVm+MMg7CKo9l0wdkMOy2dg7+bYIjgnrXhzI8gUKGmVN0umPCCTEIx
	18n7JsEdSVf4Z1FpzFY/w/+X1vsJlObZD0OIYxaT6CcGwYVRSSHGA6aQKviwimNN
	q0hZzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615f5tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 26 Aug 2025 03:21:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458345f5dso56669755ad.3
        for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 20:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756178510; x=1756783310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e1nLzkhhZ6Dc7MLNwsdj/bm+l8lMX4Twlmog9NMJTic=;
        b=Xrr7xItL8AFOHf0BoZ7D+AotPDf/Purtd6pZdm0qgvFBKKBN4691IEL6T71Vf+ZZuk
         W/b9bzg7RBNbIeA/cF3rbRm0GBKwqsmDbDmVVoyaPypH0VGBM2nxCUtufkDUdqvySSy8
         C9VBrVTbKKmbzLDFkIN8v1bLUV6xuoZAnZCxSyUoceM3bBz8GAg0AhC5SuZ+mi6bo+dX
         /bU618mYsZnDlOlEe0FTKejzN72zlYbYyWNOyG59gdMQTArwn42pZFbbjYyq2h6F9NIw
         nGRBoVSx8E1SkRMRssntjqsy2HTyevTqTyJktmjMVuqVQRn8Lg3uK2f6wut5pP9BZRjP
         zGmg==
X-Forwarded-Encrypted: i=1; AJvYcCX5K+U/Ard4N8vVCDzGtGtmrwQPnIo7KPAwq1gKljldhh9VPg7qHhbiiiS6X40x5HV3v2Nv7p6GdMyF9jHmEQ==@kernel.org
X-Gm-Message-State: AOJu0Yz1gQjCBRJDdrywvIHR3wlyI2MH2cTmoPexOjVinB964zPybaB+
	xCF4v6Me/qdWuohv9MflldPcAZ+xetyAsxXfU/r+qDe91bIvRta5k/X98KppFG6tVx6c72B0+1U
	BuC1iKM22O3pSVABexYvLeMCGCx6y7/L2SWCDa4P7ybl7pUlVEF8Ln5iSdfnwiZI=
X-Gm-Gg: ASbGncvfcCmtM+Y5AW2iKHwORqLSnZVaA3PTcbfrHsN5nBvKKl4/350nz7/DwQ791QF
	abdTscCnSKLb1U6K1J/DHMyYYxbY/kNNQ0cZhWaKqyJPFX9Ch+y4tH2avyeT6xInwgfaEtAqKmy
	Yx3w+v7rhESQwNFcPpGszicCqhbs9Clb9gl89IgZVT9acCoLzvpo7y3SdKqFbJDHO08N7VkSnaK
	4HbZifdx9Grrme5oLknXQSDP/DtHDlQrM+xGwk22nr58IXsxA7t4ssnSVkykVGKyvkJVlcPwQbW
	Lqa4iIIQhbl9xmYeu75hM23Nwy8KgrmTdifoABI5b1QHKzu+eK2NY9b/ivjoTwMolDYQkW+u8pb
	QalC56YW9+f/pxf94Z41xl5BTcHKi1g==
X-Received: by 2002:a17:902:ec89:b0:246:6fb:5016 with SMTP id d9443c01a7336-2462ee8df3bmr190273975ad.20.1756178509592;
        Mon, 25 Aug 2025 20:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1p429CG/Ztf7Ej5awbPCE3i/X62XB/w/W+MANz+ndslMlIIq3/aGc5vDshpN8dvMfyhBUQQ==
X-Received: by 2002:a17:902:ec89:b0:246:6fb:5016 with SMTP id d9443c01a7336-2462ee8df3bmr190273625ad.20.1756178509075;
        Mon, 25 Aug 2025 20:21:49 -0700 (PDT)
Received: from [10.133.33.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4b23a2e8e0sm4464871a12.49.2025.08.25.20.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 20:21:48 -0700 (PDT)
Message-ID: <ff0ee75d-a26b-4fa0-a04c-2c5ef3194241@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 11:21:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add CDSP firmware for qcs615 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
References: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
 <CA+5PVA6_-vuvwhAAZ3p98aOYyTfdQLishE+3h56oRzrieiaJmw@mail.gmail.com>
 <17db4c46-d0f0-4e79-bf17-0e4c65ddcf83@oss.qualcomm.com>
 <hx4l4h3bn36kxt2vsjm2zcrv3ho53e42qj6v6rtd5ub3ox3ekk@lyldagrlapsl>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <hx4l4h3bn36kxt2vsjm2zcrv3ho53e42qj6v6rtd5ub3ox3ekk@lyldagrlapsl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXwHa5HFLVVwBi
 ZU2TUi4PdQ6lMBh2/P4QADowN4PtptPYrL6Ok4vX1zv4muT+t0s02BhgJVa93e+wO32NDMHmuhd
 zNLfgteQnmDYllNAVMp0XLrZnrc6AcvAT4gG1oB7UTa1WuovQ7CGX+6U9xe4iwf57oUWPS+TV4C
 Qa7uzvMKlAoZ4oux/87dpxtnhuboLZAvmXIBAVIzkBLtVuiRaUqVQx8cBUhKF6+oBDmCkIgqnoB
 Z57G1cDexPAOSrFrGwZ/CGP4p0b0Dylq8jsMPDBb/ypmt+CmCBzJ6WJu7QvLfcvGnc9oimos7ZE
 b5Ly+0JbezW5hFxvXqaiIE0BRLXAiMBTMxZb8Sj9ncN7uFgCyl1tpKbnjXUA4hZWRpPq6hY14Mc
 qf4h7fTX
X-Proofpoint-GUID: g2OZpnYZEvNNa-QmLYyRdYhoSiWtRd42
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ad284f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=gbO832a9X03wdv1ejikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: g2OZpnYZEvNNa-QmLYyRdYhoSiWtRd42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

Okay, thank you for the reminder. I will do it.

The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:

   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qcs615-cdsp-826

for you to fetch changes up to 49524f3ee32837eee83bcf7fd3798967e764699a:

   qcom: add CDSP firmware for qcs615 platform (2025-08-26 10:24:34 +0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add CDSP firmware for qcs615 platform

  WHENCE                |   3 +++
  qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
  qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
  3 files changed, 24 insertions(+)
  create mode 100644 qcom/qcs615/cdsp.mbn
  create mode 100644 qcom/qcs615/cdspr.jsn

On 8/25/2025 5:52 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 05:36:24PM +0800, Xin Liu wrote:
>> Hi, Josh
>>
>> I'm sorry for the issue. I have fixed it on the latest 819-cdsp branch
> The branch contains both old and new commits and a stray merge commit.
> Please push a clean branch having only one commit.
>
>> Xin
>>
>> On 8/19/2025 7:50 PM, Josh Boyer wrote:
>>> On Tue, Aug 19, 2025 at 1:50 AM Xin Liu <xin.liu@oss.qualcomm.com> wrote:
>>>> The following changes since commit 72a326cda49109765396e08f2453c51a852e3ec6:
>>>>
>>>>      Merge branch 'robot/pr-0-1755548398' into 'main' (2025-08-18 20:29:21
>>>> +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 819-cdsp
>>>>
>>>> for you to fetch changes up to 3611a33e984859def7308c94db9c29bc39e91a94:
>>>>
>>>>      qcom: add CDSP firmware for qcs615 platform (2025-08-19 13:45:33 +0800)
>>>>
>>>> ----------------------------------------------------------------
>>>> Xin Liu (1):
>>>>          qcom: add CDSP firmware for qcs615 platform
>>>>
>>>>     WHENCE                |   3 +++
>>>>     qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
>>>>     qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
>>> Your change to WHENCE has a weird File suffix:
>>>
>>> + RawFile: qcom/qcs615/cdspr.jsnFile
>>>
>>> This causes check_whence to fail because the file name is wrong.
>>> Please fix and resubmit.
>>>
>>> josh
>>>
>>>>     3 files changed, 24 insertions(+)
>>>>     create mode 100644 qcom/qcs615/cdsp.mbn
>>>>     create mode 100644 qcom/qcs615/cdspr.jsn
>>>>
