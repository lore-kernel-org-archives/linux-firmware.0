Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5865CEDD97
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 14:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6F9EC2BCB0; Tue, 18 Nov 2025 14:35:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CC0DC2BCB4
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CC0DC2BCB4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rOhb2664787
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZ4sIue1oFtfvxMKj6GBzyA87l1c68AB1pGy1cyC3VI=; b=Uw1cth4Sxs4OtvgB
	TFZ6S3FH4TToyVTnjMZI1lFY5MtJU0fXhzwjcKtpgxqBop/c7ivHleklKtuZS7/A
	sjOiF0WqfpPpaYbI6+HfzsrK8DBxfX0qgPTsIY5Fl+XB9rHyX7+VavG2FADVvYOG
	jOKklBGVelmjl0AXCsP67k+bWgruHBkvcQTdGAHw1gNjrelfZ9MBkIw6ThwBIzKZ
	QXt45L61qTzaF7FHhNrZ+1UGEu8y/mrBKlg79R81FT7LXUikY90+Tjd2G15AZBvQ
	/OKcjERUuGKgMTzL3+HfZ0JTVK07VJrx4+aBXTIE4yWQIvvKDnQBsWhcFxEeakAH
	ZN20Kw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk8qp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 14:35:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so13008254a91.2
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 06:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763476508; x=1764081308; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ4sIue1oFtfvxMKj6GBzyA87l1c68AB1pGy1cyC3VI=;
        b=ZUKT+GembK39Au6Do/XhFnNEluoSCe6TUIFbdvVT2scguh/PfN4/jBFWeaTY2fOpzg
         iWbF6t8Xtegn/J/HE5hrlu5cwM7WdHexkOk1xxMX5JRAHJy+EST9w6H700Pb49tviJ65
         /SasbRk2lN3WAIaC7E1zKdXCEh0i96BpKwQJ3bqDY3WlBLAdI8tZmyhP1U21zHUe0pH1
         giaVGrf6b5yUDjwNXuM9Ru4LiwdAamBdtHmiZETKdPdhiGHtuk5ZU/0wrDAjp/eQq7TB
         Cm+hw/fQ8RirAWTJr1n1U+t9pj8A98vB74mqAPDQ9QE5XfQHmfxeRlwBWRdhQvaVinTu
         SqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476508; x=1764081308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ4sIue1oFtfvxMKj6GBzyA87l1c68AB1pGy1cyC3VI=;
        b=brgytaPOophCuylipCmOBXSUwXPATqHIHqo7WSOeQFwcVC3sMISemCNZHOqyD6fKx3
         C6C1mxFVLdX99x+OV+ibANV3420SaQYjB0TFw1GYafCia0UYIQOP4xTitzy02FVKA0AY
         FE/OSqQA67wD7SlVmIQ8eEGc42hE4InO7HHSPz6EWQA0jGQAEL5c6dJQUwJzeTslD3IA
         eFH5EXa0YCsxKIaOgmCMd1ePlZXIul4tyWBbg5sM0FbhoCG42pKdmXOGuQA/CCwkZXiu
         ad7eOekRCZoUwyXgx55BS4X/nL+tfwOVCkcDcrfa+98q25G4+d4wmFi1DXZkvlp2pDP4
         mofw==
X-Gm-Message-State: AOJu0Yz2xRhzNe/IlKzQ76e3xzb2LfkEd2NcLBD7ehfuuElLyqXX2OPf
	zZ06SLjcJYGMFk2spsYaZSl/RiKlrHbdWFsWd5BgOLfaHgVC8FDKkX1FbGLGFTUQaWWEYakVfd7
	mt1hKOsIHKMvQY1FQT8DPehmlZ/x/73d9TlBGOg9DqxnOdRdQevQLZiChr5d7Bvs=
X-Gm-Gg: ASbGnct5SLUZRKVusDig5FQnvqWIfS28BMqWD/PEvUXcEpA2Bi3ITLzTP45oQInYKVh
	eW1GFVWOSJp7Ne05u+GCWAG1gCRLeqsLiHoYhAHiCKKatVUIlMd1AUD/H4iS6owepIeGdaFJA/7
	2iLgEA1VpL7KqcVCwexJppukePtrypv0OvT4XHRBlGCRzTCwGjlU92tYW12tKNlL4VoFnJxmrTp
	2Cu6udZ4AsLSZjSaRNodvQMlmE+GbNBfySpSgXk0TXKfu02N/koqpBt1hXcNOQdLMsqdKUp7doZ
	RlFKj4Em+tQ3SkCcEQtR1FROaIjJ4rZt9tXcuvEzyJqTwn9XJil2o50zbDDWgwTOxQ2bVWDambF
	QAtCfJKa7Ai3y8emoCHbONQ/XFTq/zcM=
X-Received: by 2002:a17:90b:4d01:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-343fa0db03amr19773923a91.12.1763476508206;
        Tue, 18 Nov 2025 06:35:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVE+Lf1K190mRqlbxMJ7CswzrnA0j/QrGCIahkznxBYnxFg9HjNeblRdMv+89X5ZCPsEWghg==
X-Received: by 2002:a17:90b:4d01:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-343fa0db03amr19773894a91.12.1763476507569;
        Tue, 18 Nov 2025 06:35:07 -0800 (PST)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456518a1a7sm13384430a91.15.2025.11.18.06.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:35:07 -0800 (PST)
Message-ID: <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 20:05:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G_3rnwpaWrQGwR0rCZophM3isWO9tszR
X-Proofpoint-GUID: G_3rnwpaWrQGwR0rCZophM3isWO9tszR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNyBTYWx0ZWRfX/0kfZ5oUiDn+
 jOjTeaXFORQzZhCFLYsgkK0ti4OL9ZAK4kAvyULWEnBNFyFtl35dqdunuGQfHq2IRTUCZJnB3GV
 v7niyb8/HCUJG5UUGMnrNuBchCmfk8OfA9rzkli8qccQmtuUQoSSD9WC7MgMBS92eeBmbLyJUYj
 +yMVbJY9Q+4JkLR7iZyTJvEsqFcfdkJ2x3/U0bJt/SZEyTPIm+oxhgq1IocMXmJk+JnRk9mvkhD
 z4uw5V3BGGAwcLg/gRqCCaK03GF4OkvgIrZSZlGngQOcExZTOL7/zPwvT+bo/2RIKv2+4pVz7n6
 58lwLHQ/tTB/THX4QOWU0lnebForyE9vJN7vam2ys+Z15KNBQe3Mh3dww2cSFUXS/ysXmJGkFI1
 Ibdht9auJigHdvFVythi2kfP4OQXDA==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c841d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=oCeQ4VDyZhenepMZSDUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180117



On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
> On Tue, 18 Nov 2025 at 16:21, Venkata Kota
> <venkata.kota@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
>>>> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>
>>>>     Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dsp-fw-kaanapali
>>>>
>>>> for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
>>>>
>>>>     qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
>>>> 10:20:00 +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Venkata Kota (1):
>>>>         qcom: update ADSP, CDSP firmware for kaanapali platform
>>>>
>>>>    WHENCE                      |   4 ++--
>>>>    qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>>>>    qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>>>>    qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
>>>>    qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>>>>    5 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
>> The files should be covered under LICENSE.qcom-2 Made the change to the
>> WHENCE file to reflect the same as below
>> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
>>
>>     Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
>>
>> are available in the Git repository at:
>>
>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-kaanapali
>>
>> for you to fetch changes up to db069c95dcc16ea84dacb80488464e843ea252cc:
> 
> You've silently changed the licence without mentioning anything in the
> commit message. That's a no-go.
<Noted> Made the change to the commit message accordingly.>
>>
>>     qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
>> 19:45:11 +0530)
> 
> 

