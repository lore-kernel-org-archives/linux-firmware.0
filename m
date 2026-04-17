Return-Path: <SRS0=zgHd=CQ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C5DF436A8
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Apr 2026 13:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BF5AC2BCB0; Fri, 17 Apr 2026 13:58:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B723C19425
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2026 13:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B723C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8Oag51981934
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2026 13:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQkRdjaKfZSOirM/q+oHSLEOvHegpYpBNSDW1DOeQ7o=; b=P6OXzg0YTTAXTYYC
	ytEIb4oFRy3y6L4FWZjAqQZhlbFbRM3vW8DZdSD0CyEvNTbG8SjWqgGtAqYSQT6P
	oqvEqeXVvuGanmx0F+gnVcJQ55sxKKUVkniiE2xrL9ZMjMGwBI0gG8pFMgPdRmvP
	vIit/iAs6d239kAy/9Oe8PmViaJhdJkSpIpQTfutn5N2Lr0LKaNNmksuiqnTQMVK
	2WeSECd2mvCfsrJ+Ovoa4OY7re3cWzXRbdcnh7FkH4fsRN7RHEMAhJywDq0rXhfj
	Zv7XAAlvF1i78pGhwC8azGI32UW9vugeJeo/sGidPsH05F/kUGubMa1q9d6GKUTy
	TJ3ufg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jkkk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2026 13:58:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4661881eso10574711cf.0
        for <linux-firmware@kernel.org>; Fri, 17 Apr 2026 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776434282; x=1777039082; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XQkRdjaKfZSOirM/q+oHSLEOvHegpYpBNSDW1DOeQ7o=;
        b=CnX1SRLCo+CJj/gsbxq+WBDl3vA5MwwmQf743N4XE8QmnnbRmj0D1t2bfR3/agjl28
         4I6zP6n1Ix0C+a7DRb9giuybT9HtX1GNq+oAF2HZahiVH2GnuAG6kCdS7z2uhpLjoO0v
         B89fv4/+VYMUCwVQly7J7VIMxRKxGhfVUVrJmOTLCDeLVwhJG7WCoe3/fkm8vyHhJD3Q
         NI6buyKmoKnPVZzVMuFQW6Qd8ONikkzUSb5VaMdsv6VQBJLqdE51vZT9U1OeC7nogYuU
         aB/DL4+p+9NUi2Tjih0bp2pmEXhBSzaUIg6qZAWyoWIAOzzMO+7IiFVzJmJ02s6c8Cwe
         mo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434282; x=1777039082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQkRdjaKfZSOirM/q+oHSLEOvHegpYpBNSDW1DOeQ7o=;
        b=QzjBPsZL3CA3suL5jRXdfERxV9t8tZRcZPSQO/xI1Ni0yoy07M1Mc2JyJKNQcXY2bk
         ml4gMQEbrRM8xb2wEJKrZO2OJx5jQQYKsowPcvKuBtiM1sxSjotVP14q/IFNDqgt+dfz
         Y0TTe5Ny8A+8U/2BDOYWEKim2byDpzRC+mteRZzXGbBWKxpNnw5gxpgs1TG2vNP03z48
         3e6HzuUBkk8kkltmMuwev/pi8TroC1oKYtbn+iltmsANDwB8wKbmb02vDN/fbIQyjRDI
         9KkKukDiltYKKQT3wGuN2dIVHBFlOOFbEiytN6dbpIzKlanwsJEsTYVE6FlhUeYF+yag
         9E+A==
X-Gm-Message-State: AOJu0YwAsFrGpWB5ELmX6wzlo7M9ErPyUkXkg40ryN6jH1HrvjyPRCNs
	xuEhmQofuLZricGhfOti+qWr2OiH83Q6LA2/ptBLp8KxmSJ/HYnCw55XfKdUK8ap3D2kHhmsshS
	ysCFvkHk4kyU5/GCTK/VDqeHylhXb6srn9RdKhpV/8JjVwLcLWoW2HYNl32mrHtE=
X-Gm-Gg: AeBDiesM/MU2r6RBcd47ADZ54VBqpQdYhbzECfUc2hCqOi6pxMYYCcEB0/VLCzcXeuk
	3FCmXX6zcww0U+jENN+kLtbRtrrNwR6kZqc7/u9h0p+6BqkIPSY7RST4yLA7XToJjWp1jr8cH79
	PbpceKr303MFAGDeXABSlFl2lDVwpIcZ225P/WtmIagTMcNF9IuiyuG2ScL5UQmV8OCHtC866Iw
	CZ99VBzU+ViGacPqSX6P6hoxZfIPrdaMrDRPBFLFH2rY3pRx4Be+cLKJ6X3495Ki6fdsU3iCHxd
	vc0M+e5O/ENlO9pGnWFEmvHvpQwAXSTerAqfytEIAGn8dpxEqZ11yuyW6zW56A+UArbakx7jo6A
	1EpoI0zDXqVsFQqJzHlBCOd/Lb/Y4Xqt5elB0C8v6qRTlXeE0rS1cEkAPd4Ke0QsX0EjlnOlYQ6
	o14cPgWbvG03kmi7Tde2WsDGiPcUMyyXR0sZI3YRMbfTB7jA==
X-Received: by 2002:a05:622a:a09:b0:50b:893f:7d93 with SMTP id d75a77b69052e-50e367feadbmr36989301cf.2.1776434282179;
        Fri, 17 Apr 2026 06:58:02 -0700 (PDT)
X-Received: by 2002:a05:622a:a09:b0:50b:893f:7d93 with SMTP id d75a77b69052e-50e367feadbmr36988871cf.2.1776434281672;
        Fri, 17 Apr 2026 06:58:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm428644e87.36.2026.04.17.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:58:00 -0700 (PDT)
Date: Fri, 17 Apr 2026 16:57:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dishank Garg <dishank.garg@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, dbaryshkov@gmail.com, hbandi@qti.qualcomm.com,
        janathot@qti.qualcomm.com, mohamull@qti.qualcomm.com,
        samana@qti.qualcomm.com, ysiddu@qti.qualcomm.com,
        dishgarg@qti.qualcomm.com
Subject: Re: [GIT PULL] QCA: Update Bluetooth WCN6856 firmware 2.1.0-00665 to
 2.1.0-00666
Message-ID: <ez3x72jxnucoysf2xdt2cahvoxjgrtpu74heymowituyymdidy@p4g3ffxnh7jw>
References: <65ab0292-4be1-4188-ab7e-4517ef63b830@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65ab0292-4be1-4188-ab7e-4517ef63b830@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e23c6b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=p0WdMEafAAAA:8 a=hyYcZFHv425Ba0Yl4yMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: RHQf3NXgB6Lw-Hxl73j_4gQ268ar5Nal
X-Proofpoint-ORIG-GUID: RHQf3NXgB6Lw-Hxl73j_4gQ268ar5Nal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0MCBTYWx0ZWRfX57ObGnyXJcBE
 1YnkWzFm/85D1+1XdYrR6QMvxuin0fpj5s5LX7kx64SKduoLbpOmZDzVvegTZLaMmRA/C7qEH65
 +MbEV2mMo9cJ0DYuw9d/NOosiwS5i0U3pJXuypYMvhymEsj64uFSpizaHPFs46GOuQilPha/HKM
 rX2NeAvF+s8fCERAKFhm0wrppxhzpjHXBMuGuwxbvAZAeqz2z3IhgBsDBF/gDMjsi1uTkr9t8G8
 HUSwx+KFCne4AaRA/HZXR4VICciu5fAQXMga+5gPxQUyB4jZZc5zLK7Z5dvT8SPTlLxFYP6AH6f
 aMKBvu6MWwzedA3J8di4VuNKhQZFVt0WvCSaf7bowbmfjS1B7hVY8Dj2IPLoQU7wtZNpEla5X/3
 Z32b4JdZ2PjsbZEUT4UeZnXpHG28fcmnLkzsM9CpFkEoQbMWsYhv2g8OqWPYBVVExdEbzYA/vRh
 zYe9UyQWrwXttcAuSeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170140

On Thu, Apr 16, 2026 at 03:04:44PM +0530, Dishank Garg wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for Bluetooth Firmware. Please let us know if any
> issue is there.
> 
> The following changes since commit f48f551a902b3cc6e6aa8854e533902d3222a0c9:
> 
>   Merge branch 'robot/pr-0-1776148994' into 'main' (2026-04-14 13:01:44
> +0000)
> 
> are available in the Git repository at:
> 
> https://github.com/dishankgargoss/kernel-firmware.git
> <https://github.com/dishankgargoss/kernel-firmware.git> HEAD

NIt: you've changed git-request-pull format here by inserting a second
URL, which most likely broke automatic handlign by the robot.

I've handled this manually as MR#1006 [1]. In future please consider
opening an MR against the gitlab repo. Also in future please write a
commit message.

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1006

> 
> for you to fetch changes up to 6c407931301bb636b3f089196cdd7893ff2d9c6b:
> 
>   QCA: Update Bluetooth WCN6856 firmware 2.1.0-00665 to 2.1.0-00666
> (2026-04-16 12:53:01 +0530)
> 
> ----------------------------------------------------------------
> Dishank Garg (1):
>       QCA: Update Bluetooth WCN6856 firmware 2.1.0-00665 to 2.1.0-00666
> 
> Thanks,
> Dishank Garg
> 

-- 
With best wishes
Dmitry
