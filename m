Return-Path: <SRS0=HtGO=EC=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DEECD8C85
	for <linux-firmware@archiver.kernel.org>; Sat,  6 Jun 2026 21:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12F151F00898; Sat,  6 Jun 2026 21:04:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780779869;
	b=W4Yw1dmDGVjcXOAvxB1VAPeJNWZg1jnhzwS6GEFA0RsA/MQIPnJwIwWXGfPvtTGzQsF2
	 JX0TlPN19xPaJgP18OKrOYx8T7SegbDJD3io0fSo6We36LDEVUoxW1YFBtMvJ9pj9F9aL
	 9YEwLrIL2XW1KbdKUTJECK9bf+TEmMBimROR9iLG2bVPE0ssYeBa7AtIxvXavjwzSGZQp
	 5I+MDGNLoVj3CleRX/xCPczj4B2a0pUKQpOfmPOAMN15OaS4sVyU4oAJfZUPXNRyku+qf
	 Ft2EGZgLzdJO9WuXRrvHylJsDEVUc72q7gUR+G87aZsGS1UmCLNPBWlVTP6tEMP9/sw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780779869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5Qcn4rmS1Ul92kEqS/F5VhoKpSRtbDXb75ESF13kY9o=;
	b=Nh+7BMt1nwWcOdxzgzlRJL7Nlo8M4V1usy1lH1FWF0vuhg/fqc274Hyr3NJ+j4K2zQ9k
	 pXn/yB5cZ/4iCtQlcEVNxDH6Eo/0bvgcReMWlYV6lcsIJpfn0NGxfqUBfr2CUcxrynmLW
	 hodIGmtl8wqqO3us9iGhDd9BETE7SdutZCFAz6fL6kGUsPUPUwRQ08pA0Duz6Ed465UtO
	 D1mN8sRkzEXTH0UKsNjqhUEgrMvPX927YGWp6XosRAmNtOeWWLpW3rz/M5rQBwhs5qdbw
	 xpmUrkmVSimBue0d5L2aGJ5ALwYOw6poYcoL3FOhnvv17LxoFMYwTtG+MXK4X4KLjuQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9orDV0E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MOtiTR86;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59EE01F00893
	for <linux-firmware@kernel.org>; Sat,  6 Jun 2026 21:04:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9orDV0E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MOtiTR86
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 59EE01F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656Iibuo2680073
	for <linux-firmware@kernel.org>; Sat, 6 Jun 2026 21:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Qcn4rmS1Ul92kEqS/F5VhoK
	pSRtbDXb75ESF13kY9o=; b=i9orDV0ED3+7uH4NxXlhAm8xTePTlRCCu5CaNpPP
	kZ4b5e13mbTuF/A5QksEbShLlQ+HReK6K4FtWz/zCKzhhnfH6Om+idltFPLAPria
	6y0qPQT5OlfwkQpniKU1iTyo2G2iSFT5DsqZvhWF0OomACnDSLY8UqSogvT5vfiu
	g1R5miVut+Hg7OjIhoHWrmnSTDyVJOFti9E1khfTFQ2opfjNMqY83LjD8OLcBFRP
	+mzosgJN4PwIRJ51g7xeSL42m4dYAXvRarr1GwJf0bJsXSUfDj0lqr6dH9T1Szx6
	ZlClIzdTCAzFQ9nZvU6bmlsK7qjM5JR6UmA3MNoyQgFUyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4tfq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 06 Jun 2026 21:04:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bfcd629eso39688045ad.2
        for <linux-firmware@kernel.org>; Sat, 06 Jun 2026 14:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780779866; cv=none;
        d=google.com; s=arc-20240605;
        b=gjp3Crd4pBv2aIg6ZpKPQeQcuzMZUx2hkzOWz6wHqRJ9UZoVCLGmVKO0w8mWkgsdK+
         qApM12LMYPYCDa/cHHEBfh9YSwQ2dOf8wgd44L0+eIQePOXT7jMnO5UCE62RURYwOsot
         9zivt+A5LBvJPizLjmNTwaV8nh4XAYwkTPzYmE2JO04Nxoyd6lAZxcuIFD2AdG9WsdB/
         LpnnRhiY+tGBET+ciESBfmjlJ5dTn6E6xxc1DICkn5YA2iozwe+mktuRANr0pnCFaNcG
         oC+idRIIVCnQxIJ6CNnOJUiEsKe2+sf3W5/M15dhQMGNtZnWj6dKefUVZ2dI9kT2fXRM
         MZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5Qcn4rmS1Ul92kEqS/F5VhoKpSRtbDXb75ESF13kY9o=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=cmS+UXFlFis4SqVWZSsMW50GYP3k+pH1CCwWDpxxyk0ObGIko2seykttkivFgk23f6
         m11UViwJjYNlqzcv67p9qu5FKQVlICJrV722Ckgh58KSzsHqUctoLqPyEZnBl1V12vnA
         x7dkRsjnr4/XPgUqLy1KUoztUzZGP2xk4EXpsD2HCcrsJtRwwBfOJaRS/4Kw1IljO/bA
         DNUfjN78K40oi4oDPYSjA/jVyXdi36iAu1QPjc4ZzlwvLV6lVL+7gFppo4fjPFEFjNIZ
         KoxhBVHSbwiEEuANOlb+jGrSWwT68zvKDJbbGGSE7DkO+jY5XqHhEZj/4tx1SVVCdCnT
         AJ0w==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780779866; x=1781384666; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qcn4rmS1Ul92kEqS/F5VhoKpSRtbDXb75ESF13kY9o=;
        b=MOtiTR86g9OdomKmQDAvBLzIBq4PIUkUOeJqKVVfNv8zSubv0DNi9qsgLIjXD9qFYe
         XwZSVSUaJEgllavZxyPHdhaYf1vPoJjU4d3Y9epQjOMYHMBkgYEuEFEhegiRF6/uQq5K
         vKnitcAcuCTHoY5qRMRcKjXZWHM7LVlHL1GV69sXPlfuwpjuqhVmxNmf3HPVXYOP79g6
         fBW2W+bop5FMborz6oJqSVRIcIh03UF192N/Met6YNMttSccZ1Q/RQqdR3T97ENC9XP7
         MJZNtmHs2DP5PPt0UZQ+Q5cl+wVTvsAJRaSSyC1/iph6H/yLW40JwJhU5ZVJo7eIXpBA
         Aq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779866; x=1781384666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qcn4rmS1Ul92kEqS/F5VhoKpSRtbDXb75ESF13kY9o=;
        b=MxsDWAkrQJ+hwke0yrM8ixN32y63D5WdOiw3Dp6/IoZNYJpNQzZssteRj/1/knH1Rb
         wcCYrjMhempqU8bS0SaThb3SsEFocRImkudyyX2V5SJDv7CsksTt/HBxuRvX3MwEFFoP
         GKDNxaoTpYSwyExe7iopL7/6sU1xHjmy9Aw8UQ6eqKx1eQgJrUqJamhmyMqWYIJ9nbrD
         FJ84y3Jj/AGjSy5J1sTMZO64QKnM9+ui6yFrMASi0SSwQQxwNAuu/lcbusLx7Xffoe2h
         aDNZTEzvKpzhFqV3NiYj8fL5/mPw0KwCL/waXITVZKhN30g3hUb8gONgHaZWkdgjpTLx
         O4qw==
X-Gm-Message-State: AOJu0YwpMv+UlD7OO7e43NI6QlCWvbqR1zd8b/vgLedIjXweAyJ5mSnN
	77XZvEcjb6PnFSLXwhOrNF0qzWC69pPMIBIx/AzVtlVP3luXuvaKCASEJZWXa+YOARzKpVEyRSK
	6W5A4DI4XRN3yOpioC85+j8MMRfxT9Q3WBV8f9i9xBXUymk4Zr7mhFloPHRpLd9PA/vR2aMkbl0
	iOMmnIvJ24t30miS7rmdZk44+bfQmRvvDrV5kuy4LGiJIf7Svr
X-Gm-Gg: Acq92OHpbVrsI8TrcS2VbUmGRS5OJOQE3RY/+mdI0vxcw5HNKUkmZ1CeZWpi8hjpUSO
	ct+8j/sNJ6khOluCdNlbVdu373IbY53/3Kmy7TJ1FtXwK6cAHeuKiIao9DS182CjpNvh3fry4px
	IlJaVErVvPM2kfFl8p4PRCeqvLPZwUvpvE35kWXvZ/ilLhHmSpUw1a6H7qZY2DoSMcOHWslmzib
	R8f0kY3oB29BsE/UZ0IqYydYrHYpYkWfKi4U1oQPH0yj4ocxy8=
X-Received: by 2002:a17:903:b8d:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2c1e835b26cmr112564335ad.35.1780779866079;
        Sat, 06 Jun 2026 14:04:26 -0700 (PDT)
X-Received: by 2002:a17:903:b8d:b0:2b4:656b:aeb0 with SMTP id
 d9443c01a7336-2c1e835b26cmr112563985ad.35.1780779865545; Sat, 06 Jun 2026
 14:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <24b6e1e5-5d2e-49f2-8d63-a921eaf3ab3b@oss.qualcomm.com>
In-Reply-To: <24b6e1e5-5d2e-49f2-8d63-a921eaf3ab3b@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 00:04:14 +0300
X-Gm-Features: AVVi8Cdwd7Fia-B-kznsh2-fDW4iP-SN7CvLdAVReQaOc4jBjKs3sEkKpdBa5Q8
Message-ID: <CAO9ioeXOROr4rQvkGWmy3OG-03Dq-P9B1XnJXutVOzVn0dEC0g@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: usrVdP8PRZlfavkYy7_SZb2Fosgsm1hm
X-Proofpoint-GUID: usrVdP8PRZlfavkYy7_SZb2Fosgsm1hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDIxNyBTYWx0ZWRfX6kQUxafkGNyi
 EsZ/fhGWsShaKcX2RvSSnkOJVTgak2Xzyr9zhRMJCE7NCsEwT87JTVMR0qHTTO/zZtyXKHOXm98
 4TeA4Fgcnc+aLdVSbz7MtoH++EkZ2SxwF9nBgDRtYj7gWGHpzMUA9K1F0pisueK+oM5nRAoW/xo
 0KGj40f/fisavEv3HmFJeRZ9OIGZVITN+0btPpJN6PraWoe9le1zXWq5xX0JNqZCOfXTzzEcJok
 GZw7RVOl7J/5+10Mv8i/9RsGwKsSFk2hK4Q+qBUL1XGjRSKQe0mYk/kfEsuMvII/oj1fYZb3Rn6
 HZTYhVmwK1x09Oyd+D68NjD1Kn0IkL9kecTlhe8EZ4ublvVps3Z9pO898kyWJ7DZj9bTSyl6noG
 4s+BhiWwgRq68+9msJIpQramdCpwKAZZX90zZvgThPbwlMM+47LhehIY6parGMMwhrxQGFvpDFQ
 B6M/K10vYvw1gjhcXFw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a248b5b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=bLke4ZTYSS1GPkSxfcoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060217

On Sat, 6 Jun 2026 at 23:56, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:
>
>    Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-lemans
>
> for you to fetch changes up to 1aa3b79c6c4d0cc5df27be6cd6ecd3afb380c477:
>
>    qcom: Update DSP firmware for sa8775p platform (2026-06-07 02:23:32
> +0530)

 -- Added Fluence_module_fvxv folder and updated dependencies. -- CENG
Driver Update

What does this mean? Which folder? What is CENG?




-- 
With best wishes
Dmitry
