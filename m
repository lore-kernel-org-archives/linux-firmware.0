Return-Path: <SRS0=CN5q=2L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E3AC87FCB
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Jul 2025 11:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43446C4CEE7; Wed, 30 Jul 2025 11:34:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DF70C4CEF5
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 11:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6DF70C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6oosj031280
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 11:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9lm/7WtclFdMCx6L4weDfg8oq2IBsdhudt3GXYoFas=; b=Qiv0x/3KFX43dBDF
	FZChgVmdMjdwIaUSe/nPA0aGOtC3F0WWVIlHh8W57Vqvk3KtPuJkblVpJMr5U+70
	S4FZ7xzPIDxWQ3o3S/8ycOc3zvo1wAWcsjyk2T9N+osgOXGNblxzrQmNw6NQG9lH
	pw+rOqV8/dNBw7gJ6hMYENpa8PVFgG3tojCqcBxxHMZ2OOjfpOpb0qqwy3n/9SWD
	Nx6wUKB69p+D6MPGm9SsSNiwpegAt0F7piuLCpnZEfILhOvLofZDJiLABqssaCP3
	FULvkxReZkhBTMCMpEzWuIPJxmHQT/yVZvK0QF9YbxRssE+5RLJz9m4d740Dxk9F
	h1yUXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xgyp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 11:34:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073cd24febso35068196d6.0
        for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 04:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875255; x=1754480055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9lm/7WtclFdMCx6L4weDfg8oq2IBsdhudt3GXYoFas=;
        b=NrQOF6FTYCGF8FKrEutGN0/Ltzazp8rgdmKGn/9H1iOlmA1Rk+OgDWg/TFTJ0OqP+a
         PKrQlYtSXGGfae21VAL1ds/IMZo+0g/cU3+3lzSdqWwhSMeiwFF6qIgtDLgkW5BiIOEZ
         YDBrICGvWe0amzRTEqcGt56dMWU8Dpm0W7gWE+b4T4LCThbSFzVjmgN9n348jZh2cSoJ
         PHRK8l9sxkrAUbpWSqieM+vUTyPed3cGlBcMHz9LUK4vN0mBnohNj9WaR2YMDP/wQBiQ
         NDAOj+Toj4JC6hxOODDvxwDPon2Rzx9APlywx87BEBBd3tdbFulHpEkpe22lwayTU5my
         HO+g==
X-Gm-Message-State: AOJu0Ywq95vXYPPcfOvWvrdJDNOersa3LI4WzIu/Ks9VtBrJ3/SED7JF
	IQHyPvoU92Tope9HCQjmmMlN3SNPfx+p7Nu4io87AHK+7/P/kVNspIt3kkjO6k4V+xJkV2Mgyvh
	rk/I4mzznz76ynTqbTFlA2FQe9jC7hm6gVosSpzEhDKPopiJ0AD7ZgAPoCmnHZhg=
X-Gm-Gg: ASbGncubrsY864z5KV01RlrZfQBX3gnjhSPXlLLeG0cl11hXdkTRjiD7MRDPeih8DmV
	LTEzXVNEDCj2JTaYKZT5ShqqeKj9A+SSr+4U08hPNcdtPjsGCLe7qJf4pQwu6fPY0hjUSZEZ36R
	ACk6Tklb2KwqjGCESe7V8x4fyMJnNsafXMFuY8NftD6yQzIMy+F9HqIXn+ZsY9Iw6jfTWk0aqgf
	a8+IrQ/fCnJGB5U80rKvK1mGWKUEi58uy85KRFhZG5iaANiqP/GyckhIBp4+TwViHObpf8zmE4f
	90Z8Cbtklk81TUyGzDu1hlFJo9sszOKRx/5AVBNZmIIwldcroOAJaVB9V1nWkAaCgEFaU4PURAM
	1+kax4G+gw7JU6tylEFbDhR+Vk2qoNMpdDTAfudHj6w/stiga0MZK
X-Received: by 2002:ad4:5f4d:0:b0:707:3ce0:987c with SMTP id 6a1803df08f44-7076722546fmr33178166d6.41.1753875254909;
        Wed, 30 Jul 2025 04:34:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK+ZKpb4saV1vJPLMWSGq7dKmh3JxGK63JZgK/o4gpvYBMzYVqMH5YI0KrhVplkunXKntyIQ==
X-Received: by 2002:ad4:5f4d:0:b0:707:3ce0:987c with SMTP id 6a1803df08f44-7076722546fmr33177586d6.41.1753875254241;
        Wed, 30 Jul 2025 04:34:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f4278c27sm18881731fa.76.2025.07.30.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 04:34:13 -0700 (PDT)
Date: Wed, 30 Jul 2025 14:34:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>
Subject: Re: qcom: Update DSP firmware for qcm6490 platform
Message-ID: <tt2xiotxfjc5i2xrsiotxgot7fn5uesosje3i7xmdhdoreds5x@zfy4rlutzqh3>
References: <IA0PR02MB99174E0D81269451D2FB28CDEF24A@IA0PR02MB9917.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR02MB99174E0D81269451D2FB28CDEF24A@IA0PR02MB9917.namprd02.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4MiBTYWx0ZWRfX+l1xle6gE+wG
 yQhyVwzjZ1eRkVIiWVXXN0hTJS/YLGWOFTn8dH46xzz5ZLefwXlQenf2n5KTLnX39wX9DtRnR+j
 D8REvtqHMHcwZ4wRdZceNkoLtGNkNn1/7Y3JVYD1LjFKiT1ofIvayvk12f+Rmyx0xRypUBiMVgY
 u/dOav4sAKkrv6/U/iTkB0Plzmub8Gieuu7fHvdRfZnJyFLkc5fp6e9FA+avY709R5MPWlvLyt6
 k5YDvVHOueOt52PKHUmkGvFdGZ5BYjJbgSTVtnJCrji3GarYr8wAgTDQezteQl4GIxpb0+WJMh7
 jHi2QufKoHpvvxN/GJue2APbHM8zmqSThUF+teosJTNrCWDqkgaea5JowXoQr5G0u6JZq2MHwQs
 CBtr8voWNlc0V1ONJfaFaoV8KxsTGcSpepDi2NHPBaalyKtmvs3gvQmCTUULkpgBTVOInxXf
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=688a0338 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=X-UbWP13-bPYBuS2eggA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ItrwrhllZWC4Jgi25HTgwo2JMsQ-f4vF
X-Proofpoint-GUID: ItrwrhllZWC4Jgi25HTgwo2JMsQ-f4vF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300082

On Wed, Jul 30, 2025 at 10:17:08AM +0000, Venkata Kota wrote:
> The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:
> 
>   Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcm6490
> 
> for you to fetch changes up to dc2546bbb03c1d58855ac889de24e96a95d0d674:
> 
>   qcom: Update DSP firmware for qcm6490 platform Update adsp and cdsp0 firmware for Qualcomm QCS6490 Platform (2025-07-30 14:35:15 +0530)

You commit message and commit subject got squashed together, please fix
it.

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for qcm6490 platform Update adsp and cdsp0 firmware for Qualcomm QCS6490 Platform
> 
> WHENCE                |   4 ++--
> qcom/qcm6490/adsp.mbn | Bin 12079548 -> 12693084 bytes
> qcom/qcm6490/cdsp.mbn | Bin 3637248 -> 3637248 bytes
> 3 files changed, 2 insertions(+), 2 deletions(-)
> vkasinat@hu-vkasinat-hyd:/local/mnt/workspace/dspfw-upstream/linux-firmware$
> CodeLinaro / linux-kernel / linux-firmware · GitLab
> CodeLinaro
> 
> 

-- 
With best wishes
Dmitry
