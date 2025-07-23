Return-Path: <SRS0=+YNC=2E=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E80C83F17
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Jul 2025 11:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13A55C4CEF5; Wed, 23 Jul 2025 11:04:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D0FDC4CEE7
	for <linux-firmware@kernel.org>; Wed, 23 Jul 2025 11:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D0FDC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9GmOt025711
	for <linux-firmware@kernel.org>; Wed, 23 Jul 2025 11:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VO+eNV9NLrdkkTkXmMl+BLLW
	fFsqyENZbC6wohNco/c=; b=f/EEj0cNLla8nUwfn86AW89tuudwekRJXXkL42Yq
	Hk9yzZ6Gm7OBakQ8+oGdbpbj1eprk/68WQkP8dNsd0dtOcC0IEpaA5Q/g+VmEKDY
	Rhp2AyfMvnb2TrBpc4x/op3qrNsI7ZAaQRbeH7LnSNG7nOcUQ2mX0hLgKaavE5AR
	VtF6jR6pz5AyyEeO7JICbqB/f8gBXJ5Oi3RPILFmrqMBCfwiEsOvNdPA2j2GP3sp
	UOLXo2lvDgRPFUp7lOvhNl41K6ERIFSvFot3NxtEcZ5W7mDxwk7jPP2JXo/RgBTk
	o1U87l0dcMQRDxB2Cw6PqRVwZbw2GZDV9c0g313ENjZEyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ubehw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 23 Jul 2025 11:04:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e350826d99so1002210285a.2
        for <linux-firmware@kernel.org>; Wed, 23 Jul 2025 04:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753268681; x=1753873481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO+eNV9NLrdkkTkXmMl+BLLWfFsqyENZbC6wohNco/c=;
        b=lgJu+ucgZ8Gyf/wVCA39f0grCshJ22eT5103Rkp5V81OK9VGir1qg3PQhuxuOddBqR
         VKV74Oj1OmVmV9h7f/FBVkYJ/58ICz0giI85ITE2rsieJC6epzKtXMQML7UUFhl5Knkk
         8XB/xDsEBKil+p+YmJ2R0aCtXEnkWHz6wLS3YcOpOjEebQR1MDIUwMQjVJ8Hbr4u9yIa
         Um1J7sgauw00qFBYBQLmNoHe7YtvqV5yN9zGFdg1QnlCHUkv3L8XpqLnvYqvetqsFEZ3
         UeU8vVrIKsk2Kz8aywxv8bWSO75IICtFSAjXaBfQoc6YMUbzWKtFvzgwftFQ12/uuT2k
         43Ng==
X-Gm-Message-State: AOJu0YyZSCO53mOFiyu+MgMvN81D9YgN6z3Iits6wj7VIObOGKlhr9r3
	Ulr/D0SH12GZK6MUAVC3m/xqg28RvTshY8RbY/UgkChQkB2cL/z9frQacxtClJsASY0vbniNEnb
	ffsbE06qk2tdjqdmqmaNWovp7RaZZ02LNhv9d7ZMbWNhBHFoPTgW3TlolyBTQE4U=
X-Gm-Gg: ASbGncss5qJVQ13qh36uw7SWIhQDQVicYgJyvtftmzODXnNoiw3R1booXo6WLN0lENW
	U5C+ZL/QoUICEnZWtf8+b4l5PeWxDKG69Avp9xdC8j6V02LCmAHYVr1j/s4S9Y9ZzkkGZ1Vy+S9
	u6k0njMO0BFyrXublxAumt9KiMHmNgg47hDd9aJ0XQq68jiS+vvyCFB7OGWL8KOGnb2Wds3b3BK
	qmArFvzrjGlX0WfMImx6mAPUkdoTji7ektKhMG5rC4FlFzrIRyC9DXDvBjT2tCRFpxU9pZOw4dI
	Uz66YZYpZ7EiRbVhKGfA2oVQX77aEMLu1wmjbGBXKf1y5uV4ECYXOk419LYuh2IIhIanHx/XBVg
	uCN4jZo3dW6NSvHl92mxrKmPNczgHwdh2AbKZJ8D5uuFjRbn8JBJW
X-Received: by 2002:ae9:f706:0:b0:7e2:d113:ede7 with SMTP id af79cd13be357-7e62a0e1e2fmr245873685a.22.1753268681154;
        Wed, 23 Jul 2025 04:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNjL8KxaHHQMMJzSRwYw4yrtrmJeBSzMfNO4xR2FGwvwu5DxZQJQKy/DsjcorpQhv9ZvRTBQ==
X-Received: by 2002:ae9:f706:0:b0:7e2:d113:ede7 with SMTP id af79cd13be357-7e62a0e1e2fmr245869985a.22.1753268680502;
        Wed, 23 Jul 2025 04:04:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aadda9sm2266124e87.78.2025.07.23.04.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:04:39 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:04:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>
Subject: Re: qcom: Update DSP firmware for QCS8300 platform
Message-ID: <fbfhexyr6cslriwf5jekca6kya6uqdyyjf6vnkkm7bxiw56mlr@5h5eowusswij>
References: <IA0PR02MB99170EF1F67713EAE935DC41EF5FA@IA0PR02MB9917.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR02MB99170EF1F67713EAE935DC41EF5FA@IA0PR02MB9917.namprd02.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880c1cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=mXF2op-CnAJURnv0LccA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NCBTYWx0ZWRfX5dOBbaAs3Bmx
 8iVOzPBcHbKGu7bHNDl2PMD9jBNLEotUCCm5g4Qv+EgSq03YhMQN3vJcD+rq+l6d2xNYsgm4tjH
 YFA+EnmLzbUrTcgnRhw9Ch1XCsXasIY32w0xI614JBr/MS6Yiy9I8D5d+pc153h0NFTE/3Ko86h
 1PJl2HZrDZLfXkfnqGiCJ6glrThLMY6bqqknc9syIMbxVVTiuGVuGQH24/FHA8g2uQmkcbYzLkJ
 Cfuuy+zJ9ROkNHxMzC1zwAv7hBwpRjMukssyMwB5aUzvhLOgTo0ErDuI8JwttJhhLyRnz6gkLsD
 qpB0P4pnUgmel7taqqc4sVA+vndYyKXQTtrPc/3zp09WOkP+yjyzPTfPspqwM5fJIf5iR/LbTkA
 awWLmKpbX7jwBnaKu+cRysixGRxivhFz7VLw96wQRjAbvs/YCqni8vrW3IITbp8eHSb5Plx4
X-Proofpoint-ORIG-GUID: Ck5SLtWOo4osWumZOtBfgwzdOtY17J07
X-Proofpoint-GUID: Ck5SLtWOo4osWumZOtBfgwzdOtY17J07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=652 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230094

On Wed, Jul 23, 2025 at 09:51:32AM +0000, Venkata  Kota wrote:
> The following changes since commit 04c379b552c7ff194e0840ede6a2997d7deac691:
> 
>   Merge branch 'robot/pr-0-1752559067' into 'main' (2025-07-15 21:06:17 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcs83005
> 
> for you to fetch changes up to e58faa78b6d6d88f0395bef769628d04e937dc55:
> 
>   Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1 (2025-07-16 14:00:17 +0530)
> 
> ----------------------------------------------------------------
> Ekansh Gupta (2):
>       DSP.AT.1.0.1-00125.5-LEMANS-1 DSP Firmware Release
>       Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1

Please run `git log` and compare existing messages with your commit
subjects and messages. Then update yours accordingly.

> 
>  WHENCE                   |   8 +++++---
>  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 2629632 bytes
>  qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++

What is the usecase for havign Audio PD on the GPDSP?

>  6 files changed, 56 insertions(+), 3 deletions(-)
>  create mode 100644 qcom/qcs8300/gpdspr.jsn
>  create mode 100644 qcom/qcs8300/gpdspua.jsn
> 
> 

-- 
With best wishes
Dmitry
