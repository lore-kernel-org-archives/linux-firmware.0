Return-Path: <SRS0=oVa1=D5=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B39ACD6E55
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Jun 2026 19:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D7281F00898; Mon,  1 Jun 2026 19:28:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780342124;
	b=WcG1Tjxm62yBEivwfw2irGLnjPdQ49zNHHF6L9l6IcLJRzAJsSd98vkTPr+QL3KHrKJK
	 rdKz+gW0r+duE+PEv30iSapdIzMhXvCB6CQb4/IrJ3W0SNfKhBHh3A59ic9d2tfPHmesc
	 8+hqtIUrkCwRafS2SqwT+sIiocvBCQHkmwifPIr44pA0pGWNFh0ybzK6ny95zMbSUjz6E
	 KxsGvk9ugfdtIldapDqbzRnhE3KBU8n+Lp8tEHm+8/TPSU/H2xfyLZFfqdDNZM2728bv4
	 Xapzpbnkc8A/f6+hERFMwu+v/u7AeKVMYT9jV5I4mrsP1lEmfYxNu5VyPxqtbEsy/CQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780342124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jut9S66ojHpx4yYtgo3pbKwI3+cYPHMDKn9Ep0E4TmY=;
	b=0gDm15gKH9cLNTgrftBXaTd7+xoyvl97rVRvA5VBP6uKdibkLBQBwDDuDFvVtxyBXG19
	 BGm214zsGXRsTFVPLDO7C2VquOBcJzW4uaoO16gYlfuPszfMHt+qOsvo0Yilx4kYNh3IH
	 8QZI0BgxjZ1B6e/UfccnFsY37MbtUwm8uXvq9JAZYA3cHRN/g6Skvfw+yvrF5kp0gByG7
	 cWEriMThWMj2E3XfjSAMaS9FnY6xfe2XRpHZoveLhVSUHEVd13CYXDoYAXvztG5AeWPFo
	 9vQVaHhwk9xo6lAyIWbInT19Hj5XFa3wTt67ylP9j1DG5Dbi0mdzeqkhHXjzdY0gDFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YM1vB9GY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OBFOO1hZ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 559E81F00893
	for <linux-firmware@kernel.org>; Mon,  1 Jun 2026 19:28:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YM1vB9GY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OBFOO1hZ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 559E81F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Gt3w0334617
	for <linux-firmware@kernel.org>; Mon, 1 Jun 2026 19:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jut9S66ojHpx4yYtgo3pbKwI
	3+cYPHMDKn9Ep0E4TmY=; b=YM1vB9GYOXs431+K4yMrSiMfpsv4mtrOxurNTHkt
	rm8jUs0pOHwMM/YN/xI7gzyi5flh5G+cqsNVElIm35XuQmkjVdt+4cyjdhzBqhgQ
	Q2/4tBUZzS5YKlpJj8RmlI3C5asDocnHJ2t9llfpMgwgAqvnqAJSg2q9Dm5vKYE9
	hVLme6kwQlCSFIbekVRIjgo92EIuU619NdMBeeSwV4SHPaiFv3VEceTpsvrcVIib
	O54KSuPieXqZibkV9aVFe2z8TYRaR0lTR6RneOcjJdGeZP2pnrha8nI7pUydaeP9
	3Vp1SEhYIyzik9g00OeJlxuzcIAvbps7Arul6IQOXMov7g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tft7hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 01 Jun 2026 19:28:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfd47ef988so2664309137.1
        for <linux-firmware@kernel.org>; Mon, 01 Jun 2026 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780342121; x=1780946921; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jut9S66ojHpx4yYtgo3pbKwI3+cYPHMDKn9Ep0E4TmY=;
        b=OBFOO1hZtKLkjpK0unhAdZIy2JrBljdi1mlECI14oqaCF8Pvm0sAqtMoHA6Rv+Au09
         GPq5UhT6Wgg4L3E0F2ZkXf10cvPF99Z+JhegtICTwBMGSvaQDhlRuHzeomlZFkmGvEe8
         F9SBFfaWLin2Y4vCKlx6AG4WZES9Dc8HfZk/6GElKXNVg0t7Hw5J/taVp/YfxArq9Kd2
         WkWDpz6ZZxKozAqYCYN1GQTplnU43NkB3A6fa6Xq77M+4G1jGMarkqi5svmkuLTt2szT
         n3A1Uh9iyJGoDoSJ6D8OPbGn4H1iWdOpsPCRIDftFsdBioj+eVQLmzUNxqx5pgTuNEJ7
         QRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780342121; x=1780946921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jut9S66ojHpx4yYtgo3pbKwI3+cYPHMDKn9Ep0E4TmY=;
        b=ZFWKPFbrBjCGaksgqgN+M4kRECgpKRcnQ6jiCXryfQLsVwkp4E9DTymcEAXt0jt3gK
         Q8nK4Gs4wyw8DQm+Rf/P9Mr/Nnz9+j5dSJ4BlyjfLJslhqNJkKxVqCRJ8+zikkgOncvD
         wwO6FPNybDNnmYThDgv4mXEdsoQybXoXKoVeFAPYC7ypRhvGU3XeGqEAZw19ZzdiQ8qy
         rK+aWV4CTTrMFRSdpJ8bSJBUiJrthECBaHezKxbUqj24dCra7GG+N99JFPZ3e6nqw3FV
         y2016XqDKFkhhsimVgmZxi370RZOTvGWcY6CRzcOMzVSPuOhEUDpn/pdD8jfVSpPdjZ1
         w3Iw==
X-Gm-Message-State: AOJu0Yz9hVoScFojbL7mJ3HOy6UBwsV7NrS4wdtkKCIge7Jwjjo7+X8v
	m4cKRyJr0sATivRkAux72iWLdEiEzgU7GcNz7j4XWvVembNAVAcpmsvmksl13wYF8FmnjLbbJ3q
	ho3lzh2VwB+0vO7IpCwueNd7HRbOiq13SkUsIfcjrRBqTgxjAxV8Hrm7Qymjr6W6x4iy/9Vg=
X-Gm-Gg: Acq92OFA2ZiNwoCx/VJgeNqSBjtPTdeSjw+1dNAZZhZeM3ozUYEykIo4lYyZJNjJPtY
	Z+gQ5PclQ+xse1PAvsxtRCCBy/UfSgScBx69rvdqlzLfd6VVyF5DDx3fCDbV6JyzpEh2dX7g0Pd
	BpcX//M9r8eGk9w7Q+OgFdL8AlD7Dq0FmMTWPNOPTxetx+24V0Pz6dpitxBTy1OExUC04PGjPrT
	2N4sLIdqnSQCyAmiuOgQD9BlV53310X3U8yGSPxEdfJ5kckq308wFnPiiqpzAV7CC2i1/aFab8i
	GuvAaqptuVPvuftjqZjzloy1896TTFTBCiahbVYGXin+mkYNEGuEKAb+cZPQpfKD8UgBABtxG8X
	0B7UvWMqvfE/dg9E5v4RnQz2jYErn4F8JN/d8lqRwmO+n6EjtYYaIJB1c9dF+jIoYT6T+QobcJA
	QW5UrjE1qn1/eLVv/7jMeSz4/oyXOVbMI1tsdEAFLavpS3Ow==
X-Received: by 2002:a67:e085:0:b0:6cc:16d2:30f6 with SMTP id ada2fe7eead31-6cc16d256ebmr3339651137.7.1780342121472;
        Mon, 01 Jun 2026 12:28:41 -0700 (PDT)
X-Received: by 2002:a67:e085:0:b0:6cc:16d2:30f6 with SMTP id ada2fe7eead31-6cc16d256ebmr3339644137.7.1780342121014;
        Mon, 01 Jun 2026 12:28:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3965998d013sm25404631fa.0.2026.06.01.12.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 12:28:39 -0700 (PDT)
Date: Mon, 1 Jun 2026 22:28:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mario.Limonciello@amd.com
Subject: Re: [pull] amdgpu firmware
Message-ID: <cux4kauuuv4wpullm7bpu5h25wmq3pwckady6x4xn5wkcnusk5@tobsihffwbrh>
References: <20260601184330.3325262-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601184330.3325262-1-alexander.deucher@amd.com>
X-Proofpoint-GUID: pn40A_p7_aRi5Ovsn9OyqqrFHbRMeOTQ
X-Proofpoint-ORIG-GUID: pn40A_p7_aRi5Ovsn9OyqqrFHbRMeOTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5MCBTYWx0ZWRfX2CPez/TKkHIV
 q52yJieWohrXcDAeQqqCJHs4B7Ds3r1Fs8OkuXJJyoScysZJXaWLV65PERCKj6SEq0s11zoFffz
 s6jm/vt20alPSSc+3OWe4qgTEv/kmQWdfacj2Q1At3P/Wrnc1cEzA4h4CIln35+pSAn+2RaVyZM
 tAXMXNX7j5LFh1FBpKSK2RXnQEpfiQlJKhlwNiMxjVaRUDhOLqgq/7eMYQ1wKwDAiJP8IDKXn1x
 MHcg9vNkQ+bep5jaVvqrWfofLMY4SDhOEbHhUFrAzklPfYt9mJzqbfQfqzb/USzwHigyumIIqfz
 0mCwVYPf1ZbMft2+XVX3Sqyfe+uX6EHR3n5369nYLYVDLoIw3jJAo/B9tNseDrTVQzOECMnnL1H
 2dbo+tJ91sLsA3EiTZyRQuNB+GSLyX5B9Mz7H1JhUJ2RlhNOITsOngn1d8+YoVCHWtYICRU0eoZ
 8J8Id8VwzJWdQhZ7qMw==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1ddd6a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=I4dkZK4b-Vn7tAZHXLYA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010190

On Mon, Jun 01, 2026 at 02:43:30PM -0400, Alex Deucher wrote:
> Hi,
> 
> amdgpu firmware update.  Revert some recent VCN firwmares to fix a regression.
> 
> The following changes since commit c8c796dcdd3b8d1ec71de2c7a71d3d7b1c8f7a68:
> 
>   amdgpu: DMCUB updates for various ASICs (2026-05-29 07:50:47 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-06-01
> 
> for you to fetch changes up to 475f6f6d19ba253c5e03b8b51adf78bb704cddd8:
> 
>   amdgpu: revert yellow carp VCN firmware (2026-06-01 14:29:02 -0400)
> 
> ----------------------------------------------------------------
> amd-2026-06-01:
> 
> Revert certain VCN firmwares due to regressions.

None of the commit messages mentions a regression. Could we please help
distribution by pointing to the bug report?

> 
> ----------------------------------------------------------------
> Alex Deucher (6):
>       amdgpu: revert beige_goby VCN firmware
>       amdgpu: revert dimgrey cavefish VCN firmware
>       amdgpu: revert navy flounder VCN firmware
>       amdgpu: revert sienna cichlid VCN firmware
>       amdgpu: revert vangogh VCN firmware
>       amdgpu: revert yellow carp VCN firmware
> 
>  amdgpu/beige_goby_vcn.bin       | Bin 580240 -> 580112 bytes
>  amdgpu/dimgrey_cavefish_vcn.bin | Bin 580240 -> 580112 bytes
>  amdgpu/navy_flounder_vcn.bin    | Bin 580240 -> 580112 bytes
>  amdgpu/sienna_cichlid_vcn.bin   | Bin 580240 -> 580112 bytes
>  amdgpu/vangogh_vcn.bin          | Bin 572368 -> 572368 bytes
>  amdgpu/yellow_carp_vcn.bin      | Bin 572496 -> 572368 bytes
>  6 files changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
