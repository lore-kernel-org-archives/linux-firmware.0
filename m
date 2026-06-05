Return-Path: <SRS0=C1ju=EB=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1E2CD6E79
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Jun 2026 13:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A00EA1F00898; Fri,  5 Jun 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780665131;
	b=eo+uKInWlSBkaYCLk+XA3qB8xcy5mpa1a8ScLhcRojJZnFsrPqtagSYy4GAOJJKI6ncX
	 /lHiTVXuXZ0iNxHjDu/r0TfJwpFnZvAEnO4npn8H9gN1QJkDrYCuv8dGSYkOnzIyUlz6r
	 oXqsQ3u6SeHqLAHwqXvN29Jr6sPTYch944JX1deXI8mzZ19s+uUSPp92l/G/NN4Tli1FK
	 9F8S9/U7zDY9stdXjDNro4wxFO4GNrHY2PonUvHWtKnftV71SK6oIWTjHdxKPy9dHjVxH
	 Vl2ndBPB+vY3rB9NVdUpA1kDDc2yFfaxb9yyLhhD4z5XPgPrQWPperawPQJ94Q7icPw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780665131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EhTYtxQbO0lq55eq33agj1YFGBgW+C8Of1/MYAGSEys=;
	b=Ai79HH0DPGcNTpaioR+JuqGQFw97l4uvW0XoOZ2W4DYstDYED521A45X6tfJNz17m+Sc
	 o+fq3I8m4VquXvD1H+Ti60YjqK0UUBzCAHz1Wr0c5i1V++jlDP4FhaXjspelWcxDI3PUT
	 VmU/6AhP4BIJiSzRWFDBwMnRp/ZHp6U38fvrzPEwEJlbk5zUDb6fi3F932Y5l04yq3cKb
	 /YuL08XK/ak4oKE85ZethW5CaRwcGXdncZzQwVDXFQMt8NCemjVy3GGTKd6GMqZm7RvsT
	 r8wEbsAvKFcNeahj6f+XW7j1TPUsoasqdgsMt4IxK4hgUSpPRnvePFhOoN6VOZp/obw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dr0/h3+s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UQYqYVXF;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB5AE1F00893
	for <linux-firmware@kernel.org>; Fri,  5 Jun 2026 13:12:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dr0/h3+s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UQYqYVXF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EB5AE1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559mDfk3016222
	for <linux-firmware@kernel.org>; Fri, 5 Jun 2026 13:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EhTYtxQbO0lq55eq33agj1YF
	GBgW+C8Of1/MYAGSEys=; b=dr0/h3+sA62g5e4JGYZUugGPh/S6lufR1FRortTA
	wBCB3Fetc//ZDiD+i2tOKh4Al5mtKRefbseP/oysVmMLhIG3YqeNYiDDqJ6P9ayc
	DiofFMM3uZt9Xr/W3euuTBiwhsDCh/V1Fn9/yzJylSWtx3DFJYkPC0fTQusStX8i
	qK+WjoKEgJMDNTgq/fOWxQ8Pq2ko8Ykofd+sPYKtqajYYpd+RRTldl8BSqh2ne+S
	hom6HuYpTk4nM5+hB7+axt1+6p3QY28Z/dF0Pwg2IS+b1G47IDPXO2kTErhYMfZx
	0+PcZ8ivI75LU4bcwGLBa9b9smmvHOTN+mcE7u15TFf1JQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekv56gq0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 13:12:03 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-660f247c238so3809793d50.2
        for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 06:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780665123; cv=none;
        d=google.com; s=arc-20240605;
        b=OOhWsIODQfBr4WRwKtvhh3cHLqEGYYoWfDzuX2BKViwSnsEG14oH5Dh2izXNq8HOVF
         MtP28ZJQofWiVjRpET5yt9UTJzKOxc0GzrvsMytFESQJxWvsmIpW9UOfK6ohyhKcPMxE
         hS35xH5E09Coh0nzZsB8y0qT/Se8wFPqzo5ZtZSIE34BSEaIwSLUCh3AzoDAf2sScUsE
         MOncCVJMFT6aBHk/Q/9vA+RlrxzLC8XFFUrAurLoQVm1V3m7qUwlOS2OOZNHHo07p16W
         2fXr8lkrEOZJ/YIvD5+RPi+NRVef5PUzRuqfc5LkZ6OO7WondTgns/PQJ+39iAOpeRdr
         RKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EhTYtxQbO0lq55eq33agj1YFGBgW+C8Of1/MYAGSEys=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=SiS3ndpeUemHnOkMpYSobkst8g/EMGLc9kHRqcTMgggWqvBlXymgs9V13qZ9k46LGT
         lOSeIwD9ZA1D5VGft7bDZYz4bBx60O0aEKQfkoDvS1HO1UfvQ/o9WnbfjCerwiGlEFbx
         KNNIC132K85LcTVA6lK1mESRSPYCKXuKHZSWiSsFS2Jd3Ck+Z0qjsd55WPOZElv93PXc
         vCBIPJZPTwX19Ylyc4cajynBR+eo6sImgw8NvDQwLD2lkM99axEg2Bf8N6zHa+VXWhfq
         SxXoX0ZIdW0LXXYzj5hTpEiOABytB5U1zArola3k+4R8XMA4rbxgvnqzC9HI2ehnbIt9
         SF1w==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780665123; x=1781269923; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EhTYtxQbO0lq55eq33agj1YFGBgW+C8Of1/MYAGSEys=;
        b=UQYqYVXFup6GZ9YYoYINPJnel9VYE2sNI5RapiSpEEu4x8Gw2tP2ecxqqndvAY5snv
         s1ycTZtpqw9u7UlBRpIK4rJ/JLOCpo4AfVRUM+W0i1r+KNLdJ20Z606+pVmQccqCbcT5
         w1TKHvC/DOa+M94EvNOTWOazBo3h7e7UG8HCx9iIEe8xMPe509QW7jkCqOnpNity/f0Y
         c+s7ZxstIRRPU0++8gVwviJ7SO93AeQLxiHuqcZqoMEa4QVuAMpKg0SfG2MZ8+dfHGl+
         n43SdAwlZNAF7Iq4k7sDFW7ckYTRLe/FI0z2DjXvOO7KWYgcG/jC7ojFGLNKsuUnDNzH
         KRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780665123; x=1781269923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhTYtxQbO0lq55eq33agj1YFGBgW+C8Of1/MYAGSEys=;
        b=qNTwaS6cgAFvQ0xJX+LAteRm235Rjkall34G2cMs6K6TQJCpn2DBJMdWIitalLV3a5
         Aqf7TGAG1MdIFtKJE3FnS9gaSo0CBQVM9FJ8amGePS8b65YlBWZXtUtgHwfCIIc8MAL/
         nSIUyLEE9D6cTFVomNl6jSxIY1+V17q4nzDWpmueizD7kC3BjU35M7aYUYlvUkXbv92f
         RzSasjTzeIbgFnWeznHn28T7VjSaeDmwFa3kFDBP47x1XsX49fORTWJ8kE8S5VXLb1Sf
         l7miJOHwWdYxSt/RpjgCJeiQI1IHouxbsrNAEgPEopYrouCtq3+T1tDIPDQ01uHDat4H
         k6Hg==
X-Gm-Message-State: AOJu0YxAolBfkKYtzZJWvbNdONzQKVBq9+HZuA36UJLzV+HxjMGr+M4X
	6bGJIqnjsSc+6C18cJDjURAEa8cMrmVwV8ZLBy9grCdJ5/ERjUzdH/GY6d165MFrF5xCt6BA73I
	oboiqgqQLO2M0m/9s3yuuoFycfo7bbNJAhBRDEtSiuuyf/PFQarA9Fpp2wO6AY57cFGDkRW4a0t
	YrVqY3UeuhOvQEukwfIJoBu/QVvjeY0KgLzJicZwNF5DAWxVOK4oM=
X-Gm-Gg: Acq92OEAiKLMpgx5BzMyIF376h/EE6QvBPk8daquvQWT7gBrbD1NjN8Zw92lnzCgGrC
	ENIi4kpsWK5vBouV+kd9HZ5jAG3j/dLTs9T16bIE/CpMoQ6SyoF94TDbfFLObSXqiwUpMAXe0UK
	EE+wsbg18LwswSe+vxlYlEq7emCgfpMStq1PwnW8V/1Ipqw28rnazBs/FYP4OsU+GdEHLCQgYv7
	Q7NrVtFZZtTjNDPxNOgOUMOrni0vpx4km1Yn2S+JlwWMWg+
X-Received: by 2002:a05:690e:444:b0:660:4538:232f with SMTP id 956f58d0204a3-66106ffeec3mr2553425d50.62.1780665123273;
        Fri, 05 Jun 2026 06:12:03 -0700 (PDT)
X-Received: by 2002:a05:690e:444:b0:660:4538:232f with SMTP id
 956f58d0204a3-66106ffeec3mr2553388d50.62.1780665122791; Fri, 05 Jun 2026
 06:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <c5d3951d-dd2b-449d-9850-7a4a0f0e680f@oss.qualcomm.com>
In-Reply-To: <c5d3951d-dd2b-449d-9850-7a4a0f0e680f@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 16:11:51 +0300
X-Gm-Features: AVHnY4JHx2wCstPOzwBOqHDo-2ajABjTRY9xONjV5bEsq57dSMWbY9xCTNlzx7o
Message-ID: <CAO9ioeX_kSma8sZOqqVBvDRdoqGqKSUzH+GJK6+9qj_=hX9qpg@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEyOSBTYWx0ZWRfX30BU+6pQ9A0k
 i/28eorIUWEwhDIcAgqBeagX/lkroruFCYWGm1coUm7/5nx+1jGuvmvdVegse++culV5K55KCEB
 Pkrwhpr6jn/a3FSJH9NkaXNZaI9dU2yWPmFMVVpdZhe0r443fKzLeV/PcwhFU5X9ocIkfKrABU9
 nEtDFUmvTNR1p6vrxQVW9unF8lI/fEO54CbrAWynokTUCylxAD737tJzU67WQPl+tVhBiLDyDUT
 0yVjBYsc2R+qzYRL6fp+vyWLWxd9L9ngA4KXFK4P2IgeOwSK4GSF14i65VAnorsF4rZaS1HQCEq
 myL3oqY6CE773XxXwty0VEcd0pHcMAvSrwCjd5daopQ8YaF57DyuLuy37rPpg92qqZWdj5XI4o4
 1NrS5oH7zCyFcNTXsp6YgXNBqg8ktco4WSLpu6BJWaRvmQ0pF9XLaoCzQ4dyaeWt+/+DLtmUDb3
 pLqKRU26KUy6e3buO8A==
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a22cb23 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=v8TkypfccKpmGX_Is-gA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: wm6eU8iatuIHglbk0TEbV5bRfuFjIHT0
X-Proofpoint-GUID: wm6eU8iatuIHglbk0TEbV5bRfuFjIHT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050129

On Fri, 5 Jun 2026 at 09:47, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>
>   Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-lemans
>
> for you to fetch changes up to 8ce6db8cd6564895827c199635fd94401a9d4d98:
>
>    qcom: Update DSP firmware for sa8775p platform (2026-06-05 12:11:41
> +0530)

> Changes to support Ubuntu 24.04 and Python3.12

What does it mean? How does firmware support Ubuntu or Python versions?

-- 
With best wishes
Dmitry
