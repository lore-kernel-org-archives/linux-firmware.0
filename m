Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC0606A32C
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 20:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym52FXnY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9g1SHxl
Received: by smtp.kernel.org (Postfix)
	id E50C61F008A3; Fri,  6 Nov 2026 20:52:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793998364;
	b=V359VvjIQI+HIBpCoGKJOemN4iBWk91EfqeOnStL5gwloBjKoKYDdJAGzfb+N6WV17mT
	 oXEdvWvZBBMjtnswK+fiYa2MBHKlpyh27NiT+y/gEzo0BlThuRju6qIFW9jA5cfPKWiDG
	 QP3+Yjqjio1Rsn1tcPwepA32YKQTeDLvEVQlqP3xGNtw7Th6p4670IHZ2KFZKKPtOCd19
	 PXIg/RHCg33s/AwEtJOUnqWnq/1M+FcTyelLTPUhWI0OjGEVW95aNhtLnnnl7P3v3KiCa
	 YTRrZpeXsTf9nyD5VUDjMJpgu68QCdbcqQ1v2njBj+I1ND1Cy+aoYwjfsxQaynAyoog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793998364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+ZKz6bhuYby4zPfuCHwkZLpjOLrSphLLM4wBCm3N4zI=;
	b=MqOfRpffpDcdqcmOi85Zcl340NuiYyAnXc4PgYstS3hkKJ8gdc3gSTNZS0LmJqr2xBcD
	 usn/LaIjckOnWN29ItbKS5Y4XzSgrGwLTaZiu8Mioys2A7Z1+tciSdI08gkWt3FusmE6x
	 UNuvOctNMyyQgZ6wouahw5cd2Vnz1tojpdMLCudd74ElILSk34OGepoKxitEKTkQk7HJw
	 ADelsx5WTSfakRrJpAiGXUonV1HOqGPu6uzv0lrDwAkf9G9ObExJZ0LNA/kz2LZCCNM2u
	 HmoocmGvgv2YZ3gOmplmzIdkD4TKeP4ciMXpxXSg7f/+fnh/lnAtkG4jat72uTAJ6gw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym52FXnY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9g1SHxl;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BEDB1F008A5
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 20:52:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym52FXnY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9g1SHxl
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9BEDB1F008A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JLYTu1263338
	for <linux-firmware@kernel.org>; Fri, 6 Nov 2026 20:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ZKz6bhuYby4zPfuCHwkZLpj
	OLrSphLLM4wBCm3N4zI=; b=Ym52FXnYyO27gB5yKEPG+ugHvWqFrSj2YhyoCutA
	Lo1+uJv0bvfoF1M4XyvT8oQd3cdr5XLd5csLTL4oqrS6bWCsxvYf7dFaamh8+v7/
	2yZ0Cwd0lXMO8hiLeQkb1jh4dVLX5TKt03Zl8fFpYWTPVUti1Mp7hFCDboIH89tL
	f1h7fx1FJJShwJ/U/7emCG3shibRKefH31SYI0OtHF73xVPxXsv+GSGPwxvYrr3B
	SnCAI5+Fpsr5Bi79F9QCtSRP+8rqeUJ5MoRuIwcGx03qWwPUDgIWref+oE8jb0e2
	/JIHBhxw6Ypmec10vohiH7XDEUtEd3jFzVYjmiIfBtH/ZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmywr9kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 20:52:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so350094985a.3
        for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793998339; x=1794603139; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZKz6bhuYby4zPfuCHwkZLpjOLrSphLLM4wBCm3N4zI=;
        b=V9g1SHxlYRKuAhJXICgeNbnNQJCyzR1CbcoQ887jvak7rSZtH4bluy9PQXV1lx6x29
         O4FBZNBaaH9lcbQdcQcKcsvQSIz5ye0MEvdwdOs/22LIzaifOzMPF9nTd/8dydE0MzRz
         dJi2SLbBoR94FJMJiOO6dtu809SmgcjWKPo+DHdqwowOh86d6CX/RyVeIxuVl0bOgrGv
         biNQyBSbCkXJATjsw5FDUOsa57B55dNmfn7IKGIaJpDXnFxHkAqAgs7EWzzsNyPEVzpn
         Jqv7Aa4ibrpqnMHVv6d7FKzUCu8r54GSf27cHo/rXm2cpv7Cm1qo0XZt6yFoABBiEYV9
         myFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998339; x=1794603139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZKz6bhuYby4zPfuCHwkZLpjOLrSphLLM4wBCm3N4zI=;
        b=GIP0jCQ3wY85C18l7EIB0d/Z7R//o7j4/FJMeFQlzuH/j3FNqmCrMnbyiy4nU/eACS
         z6IDLyqdUBlZnP3DC1M4Pojz1JZV+djbxf+Hv1sHH1FC54PXGj4jSYXSO2nQS85+RVv2
         mcC7yjuSUiCFcfVXt8dEDmHghO86kPyQLaR5P2tcR/b9AZYsjh3xqLG8ni5IP12JWw75
         3jDSWR6rrkzyAhrQ26MkqK9j2EhJN/z2huo75dOZaIkZH9WMciV2zb6QAARsUigtga1W
         npKSqp3WCij1jVghKyg2PayemiLilOMISjwgBaEVIW5n+tENbCbWmZ013xSt6Z5kEWKq
         tDlg==
X-Gm-Message-State: APuU4Z9q+GzYU1TBeSPc0WT1aVFg40eQn86F+au4tBU2BuLt3QGY1LsX
	ljjbbqMQZvI81iKzLvsc/naUv8M90KGjqIOupEKxGN8zbnbsH4qzeSU1jNHwMic50e9idmH/zQt
	p4sPaZN/jc60OmMDytASZsy2+iZfLGUt4l1XCznppzpPl9U+SPSbORyOMEP0VAhn+HVQt6lo=
X-Gm-Gg: AYBFou2ssCNtNTxZnrPF03ciYG+MpYit6zbdIjSTO1PlpNRz3LfA3sEABOXpNMhQ16f
	EnbhaBq/wC3PmTXRTzyfMVk2K7vAWZ5Bg6IFFoL6phKEvZQ4U9l1VtmpGi5ey9HllE9lhYzNs8/
	udXn/valPDfr52IKJB9son+WNubF1vYJ8Rx6dnUpUatnDiyVFmD08lyrDqc2rEKEveEW4/jyn+q
	UQcE27FyuQREQbZJVkyjCkTPxIqziWYkB6xsCin9Up80kp3rJYE0Lmzqsy3I35t0YcrRGv6rnbF
	vYYC9mmWxFUVD5mUColBVQmYi7LDA9cX21O3RC8Cujzmr424fmbIH1kH6zREEmwpOhOekhzPCX9
	EfbplTMs/Lu3janUgYoC6yUo/sYcI1TKP4OQq5f/8Lam7pSTB/M2Bdid9G94Oud7S8Qm7WTlASc
	BgsTljHIqLDU8D0xXT4Y+oFLQa+sjgIJ+pdbPDxNP8WxezC18TbYoEjTPpDUG9
X-Received: by 2002:a05:620a:1983:b0:93f:2ab9:7294 with SMTP id af79cd13be357-945f34b6bf1mr589809485a.29.1793998338991;
        Fri, 06 Nov 2026 12:52:18 -0800 (PST)
X-Received: by 2002:a05:620a:1983:b0:93f:2ab9:7294 with SMTP id af79cd13be357-945f34b6bf1mr589806785a.29.1793998338508;
        Fri, 06 Nov 2026 12:52:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003087030sm525370e87.62.2026.11.06.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:16 -0800 (PST)
Date: Fri, 6 Nov 2026 22:52:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-kernel.supreme403@8alias.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, baojun.xu@ti.com,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [PATCH] ti: tas2781: Add firmware names for ASUS models without
 a speaker ID
Message-ID: <rt6e362yujxmemaqwg4ywpfubfqpgxfznkzt3p74dqa2r7rv3m@kczfybjlnktz>
References: <179396478879.8.13751503013951596382.1751156862@8alias.com>
 <3drvkgys7dre5tegwquecgcwezxw46u3trp7rhjtmzgdvqyeca@steei6i2cskt>
 <179399805883.7.12517291827121133057.1752646207@8alias.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179399805883.7.12517291827121133057.1752646207@8alias.com>
X-Authority-Analysis: v=2.4 cv=A6j5rKWG c=1 sm=1 tr=0 ts=6aee3e03 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EyC9BqI-AAAA:8
 a=UOvY5qFuRGHJlBgA2BIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=V1rNeAFqr7mUYiG6BXD5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4MyBTYWx0ZWRfX5e/cf0AqdVwU
 s5L05TMRhOLSXp9kl9vDVJSzUptNP/M0T2E8rG3yHJHmll1x0mKmasm/OvaP65BGcN3gDEeGOjM
 nfRXASFTXYHPnKEriSmBdWI37kzEHBElO/GKCGk2rQfzpRPwcdN5y2tl2NBblhM+nc83JDfw17S
 9BRWAHjwR/TQEAe8bT5uiJH2s1Glq4UF000LtQiSlkXGetIPftV1F3IXqXUFuVhvzzYVk2XpS/8
 Mej59Z7E2kCauQCrUz+mhpih8yQSEW7uIvLnmMQyEBlWZx01dG8uDIkKLTs3MES/6u3GnQwZlL0
 WvFkZ9Z6tkD7u4KmUMyI8+n5mBxnYM2DWAmt23yXyuh+5a9S7eaTDh5Pv9+MD0pBIwi5KMkN9jy
 EcfPAqFhaf688CY96BY30zGoSV3TRLUu7Sc6a+ovSJ5RsbK9Gs5P2k2DQPTjGgZB/+djp2Sat/E
 +yHEibMEh7F85ZXaWCQ==
X-Proofpoint-GUID: nRZdldDcwHjTV5uWtN-qUTaJNPLhy6Kp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4MyBTYWx0ZWRfXykpqLnR8eiC7
 3gmIeNjGg8QB7A05k9MiuYsERCIrJOR8ONOVZxn3fat0zCl81dkkYoBDqw9YfkiAX6bFkyHrzGc
 r+HH5690e2x6cvSC/8oAkQKp+NuXHLI=
X-Proofpoint-ORIG-GUID: nRZdldDcwHjTV5uWtN-qUTaJNPLhy6Kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060083
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 09:47:37PM +0100, linux-kernel.supreme403@8alias.com wrote:
> 
> Hi Dmitry,
> 
> Please use assembledev as the author name and add my sign-off:
> 
> Signed-off-by: assembledev <linux-kernel.supreme403@8alias.com>

This should be the person's name.

> 
> Thanks,
> assembledev
> 
> > On Fri, Nov 06, 2026 at 12:33:07PM +0100, linux-kernel.supreme403@8alias.com wrote:
> >
> >> The TAS2781 HDA driver builds the DSP firmware filename from the codec
> >> subsystem ID and, when available, the speaker ID read through a GPIO.
> >> For ASUS TP3607SA (1043:3e30), it chooses:
> >>
> >>  speaker ID 0:       TAS2XXX3E300.bin
> >>  speaker ID 1:       TAS2XXX3E301.bin
> >>  ID unavailable:     TAS2XXX3E30.bin
> >>
> >> On TP3607SA with BIOS 308 and Linux 6.18.59, the GPIO lookup returns
> >> -ENOENT. The TAS2781 device in ASUS's BIOS 308 ACPI tables defines only
> >> I2C resources. The driver therefore requests TAS2XXX3E30.bin, which
> >> linux-firmware lacks.
> >>
> >> ASUS TP3407SA (1043:10a4) uses the same naming rule and needs
> >> TAS2XXX10A4.bin when the speaker ID is unavailable. Unsuffixed aliases
> >> have been used successfully on both models.
> >>
> >> The patch below adds the two names requested in this case:
> >>
> >>  TAS2XXX10A4.bin -> ti/audio/tas2781/TAS2XXX10A40.bin
> >>  TAS2XXX3E30.bin -> ti/audio/tas2781/TAS2XXX3E300.bin
> >>
> >> For each model, the speaker-ID 0 and 1 binaries are byte-identical, so
> >> either variant provides the same firmware contents for the unsuffixed
> >> name. These links let both models load their DSP firmware automatically.
> >>
> >
> > 1. Missing "Signed-off-by: author information"
> >
> >
> > -- 
> > With best wishes
> > Dmitry
> >
> 
> 

-- 
With best wishes
Dmitry
