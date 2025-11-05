Return-Path: <SRS0=s5Lg=5N=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31D9CCF9E3
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Nov 2025 00:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C551AC4CEF7; Wed,  5 Nov 2025 00:43:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5B9EC116B1
	for <linux-firmware@kernel.org>; Wed,  5 Nov 2025 00:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D5B9EC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfpDh3165204
	for <linux-firmware@kernel.org>; Wed, 5 Nov 2025 00:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lV23YJY7lrncqNDRsyL93NaNsoHZ8R6HFP0tveLsYiQ=; b=L+ebT4AZBGXF//sg
	xK3o3yT/+3uRPQCSBFD+90jdeqRu49QGCJCrh6MtvC3Q68CtJxthFlXR7DG05UK3
	iPBnnfuIWBirGl1S0tkhdezB/LiCqqR2zax64kYoLIP+LK6ztRkwkfH9e1Klov5A
	v79WCSv9D/M5VxnI4npSEj0v3TKfvQcaT6acCl5ZeIGFOA9vMxm5vIt2mGJebNp5
	bnM85MuzhC/e0ttc1AC/dLMUftmG0kFmL6NVU2xy/wuyITmxlZ+bOJrSIaOD0Hyr
	kXV59a1xk4/7J8xx0QhQ97uduawr7zspY3oHUg1aKZwm4AWArckVrFpAD0Watzf+
	WefSMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7kethspn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 05 Nov 2025 00:43:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74ab4172so3969571cf.1
        for <linux-firmware@kernel.org>; Tue, 04 Nov 2025 16:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762303402; x=1762908202; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lV23YJY7lrncqNDRsyL93NaNsoHZ8R6HFP0tveLsYiQ=;
        b=acF+dQamV6dW4DBqaDDldkxOV+Hq9U4II2aoH5Z8edwRD2c6SgUoD7HiVxjIrYMYiP
         daBk8E5Yh0j6MmQoeEC5AfSDeTQX9ElpA5aAlZ3uOM+PCe++wMykYC1eADTwJNpQoMfa
         JQoUTsLyx+8mOzliLQXK9fmJtAUZhkGLB7205isLclG16FyfBjh6pPIL6WR4ORBozjxT
         4Yvr3KI7YJvZj+/JisjTcBBHkTl16jOCYbvSatMJxmG8Y7YVbeSEFTk2SO2k0BuN9LsS
         w92lqk0psq3iUf+4a6ll2W88wSKOwXCG/uNwtD4GxPCUB5GJSE1DyMtrTrns/dNf1eVb
         vrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762303402; x=1762908202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lV23YJY7lrncqNDRsyL93NaNsoHZ8R6HFP0tveLsYiQ=;
        b=Fs4sH20AqjcENuRfYJHAVPUju/Zjv4gk4mf+5ThiPSFKOPYk3ly+C+E96MBTiaYH5P
         1pbFIPTf76ruGb/kAcKGqR35gBepn6wZY/MVIQtyl7aZYhcwDV9u5Sdk8q/heSEAs72C
         i17vGUQXck0q8tQ30up8fVet23R2nCHpCrtVv5XE8+0cgeqqeUov1PsYrf7ErTTRsXvw
         HuxC5I9Z1u4UXTFal5x5yNL0lgVO62jmgK5c3CkILVtkWOvvWFbDvXJnxrkLeC9ecTfS
         RhyivAM0/v08mkvFSpu32yz6toRw3I0g+8x3+MIBhu6GEqZRIW6Kkmp9gSfMu6y0EBtp
         SoEQ==
X-Gm-Message-State: AOJu0YxSDt1+bsjEbFsw3qIB1Eme+qATCPo482jkaPaasGAfdziP2fcX
	AIaj/F1JnDiHLDLJ//CF2vE4hGPt4xXih7cyW3ULVOAxNlMww4F8DSpzx7Z46L4ylrV7TuYmbmR
	R81C14iPmhL1jwzp0aGUqlN5ZGubQDthsoqmWeOleLbQr8UCmsrQwm+nQMnUB05k=
X-Gm-Gg: ASbGncvfETgABezSeyIVmz3tilvXz+TLX07GZO0jHu3uqp8zRYJky0P1u3/wYWifTJK
	WTbeX9wncbv3iTSeU/9xecRC4LaUkTh81i+zAgwfQ8WiEYdfe92k4TAfvxRCqmBbbP+jPjS8QSO
	7llF2Fdoo7v1r8OB2qyTdBt4ZOLE50K3Xlf3aKZczlyiDLHzGgyx/ezq8q40oJsPxEWm7svSNdK
	knWtpu0ULwEBk9p3ArJ12ElnjiIgyhgnKgiwsYeVvVQ3p2Ue1o7bITH7PtjoEfxuKmx56DCbhZp
	tuyuBVqiEsgEzZzFS2RFT1Egy2BIrRACyBPdFLI5j4OaK93YXWJzBdx6oxUf0EByIlqTFK+c4VQ
	g+Eb53dHBiztl7bOpVSi4PhzdDEGXvZHOufL1W2HWRcBwM5pKgkW35RnrWPVQv3hosH8F6nNj+T
	FWv5o0My5KukIw
X-Received: by 2002:a05:622a:4d06:b0:4ec:f5d2:9dfd with SMTP id d75a77b69052e-4ed7264fc23mr17518921cf.83.1762303401871;
        Tue, 04 Nov 2025 16:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0GgI0pEJrbixZ7npzxfr28/vN7N6KKvevgXFJuOWfAaK7v/1Yn5FVsyegNeX0h1v6d7DZNw==
X-Received: by 2002:a05:622a:4d06:b0:4ec:f5d2:9dfd with SMTP id d75a77b69052e-4ed7264fc23mr17518781cf.83.1762303401389;
        Tue, 04 Nov 2025 16:43:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594344398f4sm1174938e87.64.2025.11.04.16.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 16:43:19 -0800 (PST)
Date: Wed, 5 Nov 2025 02:43:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add SOCCP firmware for kaanapali platform
Message-ID: <ea5zs3xuoiz72r65h4i4hgapjhap6sgo62qoeh55vgglsno5i6@wmljk3t4gsh6>
References: <0fe8b17a-977b-48fd-8eca-1fd0b5f15e5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fe8b17a-977b-48fd-8eca-1fd0b5f15e5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNCBTYWx0ZWRfXzrNWwqiKn0+L
 3qweeS9txMaDTJpVV9hT3UAIb8Wzg60VRuDd3MYmFb6WyiSt2Js++bLWKuUbla0e0Ei+AIpAfX9
 l5KzR32kgTvpBK3j+1/KjMlH5cGMJ1p+0i7XVCIDjKewwZZkZy+F4881TQGXG8HjjR5lPuqq4Sc
 BSWCGPakFFqfaWgDjtrJ6jUmUwh/7quPaqmYUpBNRvyTHhgTqubZPLP/0CuZnzwInqzGJfQlNH3
 ujEpFFGpMYueXmZXRWhboOWmoMQlF8NGUmhSd+mHG+FImGxgRA+vhtT5WMx3KWZYBoZZvjaQHSs
 4iFjXRFRfubidf3ye0pV91r3W9m51H8yOTVSrYVVUnNFhL9J9M6i1xL1NBst5kO2SqEPqcIRgmp
 mzMSMuFJNnz1d1pLuTZO0KR4OxT0kA==
X-Proofpoint-GUID: oxErcPlgCL3fCG9upOP4gxPtMWK58jR9
X-Authority-Analysis: v=2.4 cv=IdSKmGqa c=1 sm=1 tr=0 ts=690a9daa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=hesXoVgocUY6K2JOuuwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: oxErcPlgCL3fCG9upOP4gxPtMWK58jR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050004

On Tue, Nov 04, 2025 at 05:04:43PM +0800, Xin Liu wrote:
> The following changes since commit 4a1728d0f464fbd73560239e2d907f8f3f5614a0:
> 
>   Merge branch 'robot/patch-1-1762131560' into 'main' (2025-11-03 17:39:46
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git soccp-114
> 
> for you to fetch changes up to 08a87b01cf1ff12def895cd1cba418d4d7ff432f:
> 
>   qcom: add SOCCP firmware for kaanapali platform (2025-11-04 16:56:50
> +0800)
> 
> ----------------------------------------------------------------
> Xin Liu (1):
>       qcom: add SOCCP firmware for kaanapali platform
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


Mario, Josh, I don't see a corresponding branch created by the robot. Is
it working?

-- 
With best wishes
Dmitry
