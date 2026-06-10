Return-Path: <SRS0=Adzc=EG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E49ECD8CB2
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jun 2026 10:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EE7B1F00899; Wed, 10 Jun 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781088623;
	b=U/nn5VNSnjKoLR703qrW+pEu8hO/aEN2XXdOuzZ/4pwsQ+69Kbu0R97NGAeRzrQW+YRq
	 KQht+OjxTMZ+z7E81y0LYA3u5iLf+HRPBQyupGCQTA60C1mMgpKC0xjiHeJSKtXB06sss
	 Z1iKf8M6YW6EbJOs9AkFbAxr1F4bhTYTfRFdfN+L11ZvbG2cwA7ol4F7BKpubd8m9Xpgk
	 tmQuVT1hdwZNDphREtjhcKym+fjKBY3p5swzRWkHPPAB8FUEMoo2LmsJHQGB1shnEBYN9
	 F2uoqi02dvMJHsKQc1DrTw6h7g3GaxqR9OXO/+L3xBpyVQKS7wWUQGvrHniDP3TjERg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781088623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2TJBaag5izLA9g+arap5RPhoscMfOUHKrMfEBmagsoY=;
	b=eIixsT+J1H5mmPdTgr9Sz1q4ER6X/62ORwz/q3nDtr5+S3GNbDgy2CXNDJ/LeTLTWXJP
	 y84obQ0amsgKi64S6ggUmV7XRO70Bk8DvpNGDyNt4tBJnGbVm7/yxu+LyW0xl96qTq+9h
	 ehqMC3QyDHFBrrx+CT4RbxCsCsOQ8TEv09cdJSWucKj2SGE5IvdrFQpuaBxIBzXE3Yhyb
	 gu8uVl/+0kmQeS0tA6oZCb2XAEXj+7u73I/p7U1gV1qtv0Y4bgYdqj8h+APZJuoL18Vcx
	 yA/4B/Hj9xVuql+NMozTIYvBRFW0+/6cqsRl0lbqw0AHfIWl+Fc/en/YGaBtjgsXo6A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SazzT+uc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6rfQXFF;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A44861F00898
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 10:50:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SazzT+uc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6rfQXFF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A44861F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hgN4531344
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 10:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2TJBaag5izLA9g+arap5RPho
	scMfOUHKrMfEBmagsoY=; b=SazzT+ucY5pCIQAn4aT3RCix6jtIvUViKqMqfHX9
	9SZiXPJBfZkFaZBhwaAEh1tFL8DFw69jva3WMRPygIIYKUm8Op4wBxeShS37JTjA
	ng00hSWHE4KPOtU9jObGS772D7+w3cMS49TrFHDlgdTK5I7uMHphIewwysKrVeiS
	WniKqGB/OYOBmT8RN6gQpb3HXFr5qnh0tW/801gq1o7bH5CQOsxTEww4bZoP0hF9
	5evpcPRuPR3ghmqZySFMhIoE9KURdrNTPufeFX8T/WFO6kKCBRRTgKTVA6RrywFH
	q+q2tW7CXc/t0GRuj+KqM94T/LFK1E5uJheIcngMi9NhIA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1se56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 10:50:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so3420294a12.3
        for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 03:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781088621; cv=none;
        d=google.com; s=arc-20240605;
        b=jaPMGniImH2VHrz4X+VQ04SoACHTxkfKZWj5vEdd0y88YLzwre98lKJ3Eg4BaxSG8m
         kB80B5DuxN/0/D1IwM/uWHjogTl9biZfqEQ2sVrdzEQpEVgdfdGcm1AFvhzexZtxcvvS
         J0bCapJjKqe7wa/LwlHSfDFCEXL5sB1BkX+u2iDucTDA0opIJ3BSqnvQFxz7Eod6EvBr
         eUgIGyjkFuBg/TU5o9oqCFJA2PAsI6k6/yEQ4Vbcp9k32wwBaWJQZOfijXvEaLGuXhFQ
         si3lRPPzFlAgbdWT/y5Z4lripLu9ZYZkD/mGqhCveEikMDxycDoSdnsF46tadlnxuBsm
         mVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2TJBaag5izLA9g+arap5RPhoscMfOUHKrMfEBmagsoY=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=S5Qeh0iGUbU7ay6WzrJxtMTM+yH3z4FVjg7YlcwF40/io0aKfPUasz3uuBCeS+E+Bx
         BYlS6Rj0ocx29jRSmtDSzHHUsPjL1wGAzXazyv/G0ncGZWhPmzRTz76ffTgSakKwkum5
         PTlXs51MCCS/1s62et6tR5WWsTBo45Pj0IXp6pS3ZWf8OzGHWB6ow4NM1vowFT4e6x/J
         M831qabXULSnVhx2foIqwNxkG2uFHi8l7d162BYck5al4UM47xgWJ5fh+2IrEunyJjgB
         dWMWRPhTKEv5qvpN6pShJrUX5k8x1Q4dAx+pORLeD91wJs6pgESuoSu5qg3rnRp9hJRb
         L+6w==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781088621; x=1781693421; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2TJBaag5izLA9g+arap5RPhoscMfOUHKrMfEBmagsoY=;
        b=K6rfQXFFyGfMWieMpC9EjkixRGWCRno0TfTnfFFbmFejGZUJ1fYlpMTfsJ7qmzYoO7
         2IdnaKx2g5yAUiFebL8xm1DrlGfoVK5VtEcXK3VvWdBMwzNeQuOMXp4fcbv13ePliYSK
         e7w90qTAzReM2a4+G5XC9RVsieGZ4kHiugZYZK6PJ9iTplJKDQOyvUoviwz5ox9CXTNa
         pEyloFJ+sPVjcUJDrnkQw3LuEZozPi0uz9D0BfzwFVAbbzWiNcTLtpAtS3WXK0915gG1
         3LHp1hcp/D7vhkZbn7/TR1H23seIsNxU5n1cjHlfuuW3MESXyEdoBtU4ThS/39OxdMM0
         wbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088621; x=1781693421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TJBaag5izLA9g+arap5RPhoscMfOUHKrMfEBmagsoY=;
        b=VW2D6G9NTji5kaeFyfKWtwO3+Hyc47hPmIciHa9+m/ATuUT2o0dqM/XBu4GkZj9SOm
         XYsTFKUvQwmbBL76BgOW1VsMVDnmZf+RB4GUSQJgX9LtcA9RBbDtG+boB2+BnZBV+b1L
         I/2iY5x5RauIyz74QSbFPQGeaqbTAuemdM6p0SvjX2/ZRF025ExdILLVwlB+JEqEUuB+
         zCQxp9KWZTYceG05RbxuIlWeFh7ZKatRffuJd2apygKq75S9lsR0Mk8bJWeYfNwj1LeR
         Jl2yG7paral9IZ0uhDzlQMZudg+rlq+xJQN6/cWA/68DelO3haER8ffPWtlwpwS1cojm
         Q0NA==
X-Gm-Message-State: AOJu0YxCnzrRlmqpfeijm3iSozBE2GB+yn/9veBhP+wH4RSrRbAN8ECw
	a/fNmh2Una4ZKbsilISYFOdW6ZpgaD+HcEtq4XvXTIGKs2ztBVY2yMMqsVSY5sSYUaQ+BEb/yNU
	Ijba4ZqBxl8ZRKrPcwuxFFtUC8mirCmAH1XNAnk0i3LBZNb5k45XLUbxsczspZ8b4lI/j3mqbrc
	E+9O/ycq51qAL03wzNocY/H6O9AUZ9sJWHpXSkS2a/hI35SA==
X-Gm-Gg: Acq92OHaiDcPLZ9OyQh8Dl4lWpsvUvbS96a2udWpcxZfSAv8T0zkJji5mO2T2E3aU6b
	duL1I4QjKvuaSrIcHU/uovdBWAvhZOW+8PDOD0/OeITCwQjE8aWwsCL02CF1hdOWp+ida6haR4t
	DOk/5Eki0XpZ57OeB0wOdmq2E1fUKGX/k9eyiwFUUBeUhvYFJbqOy7zSvsh2X/5VxhCYallnJW4
	k/T9DrY1+HiFA3HH6/gx88x76Hsn8HvPtFReF3w4kCmgDE=
X-Received: by 2002:a05:6a21:514:b0:3b4:b6d7:a992 with SMTP id adf61e73a8af0-3b4ccd1e2a2mr29850183637.8.1781088620899;
        Wed, 10 Jun 2026 03:50:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:514:b0:3b4:b6d7:a992 with SMTP id
 adf61e73a8af0-3b4ccd1e2a2mr29850154637.8.1781088620383; Wed, 10 Jun 2026
 03:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <cd48d687-d403-4b40-b23c-8eb3d4f5708e@oss.qualcomm.com>
In-Reply-To: <cd48d687-d403-4b40-b23c-8eb3d4f5708e@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:50:08 +0300
X-Gm-Features: AVVi8CeEQ_bxXvZ5fQ8M47WxjhA9_Tv5cR373hSkVtTviPuFSRqP2MbP7dV3ZzM
Message-ID: <CAO9ioeVpdtrrp54wdFsk4AEoMzvFsPYJWgN8+nDdwFiAJaUt3Q@mail.gmail.com>
Subject: Re: qcom: Update ADSP firmware for Glymur platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwMyBTYWx0ZWRfX3LMND2XM7UXD
 ZThrWA5zCcWRT/dF0QoabErFoJ0wr74au+iKHUyaq4iRnsjtiy8CtJlip6eocZ6bin1yC33TR6n
 kBiBziqV9Ub1AUMkblWYTDLpgXtsmDNTTkwacEp0irCJDp1+d8lzdnQZ7ZT+0bWCYq5ltlaUii9
 7SHUWv7iMxDYt4EFgv85vI7N4LByIv9tbRQ6ffm2xWMGUhR8PbGYnYg+e4O22fOMsyeJg/E+b9Q
 cRBzQmrVZgjHU7npLZSVgO0mJCIKcykvGG4FirafelYA00PY3yB89jMhD8uocth3i0zXRrM7Vcg
 IWvjFqew3G1qkbu2TJZwci0Rz5St4vE5VFxxW8KHWzt82ueYQnw7vOTO/ieLegq03AuCHsiDh9l
 BZ8HmepcgqqkyejifYbOzxEsGSH7Huajz1mEQvlkqCzRYuRyphNKfgxG29hX+Xq1pBdVXZUORmB
 8i10xXsnjdIdQGYT5vg==
X-Proofpoint-GUID: 3uvR6LPVKClJw4MNbluob53ThBhZjVtf
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a29416d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=3f3ww25s4mDjSXRyIkAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 3uvR6LPVKClJw4MNbluob53ThBhZjVtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100103

On Wed, 10 Jun 2026 at 12:18, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit b672962ed4ea6f9de52bc7bf9e04e96585eb512d:
>
>    Merge branch 'superm1/unknown-license' into 'main' (2026-06-09
> 19:38:15 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-glymur
>
> for you to fetch changes up to 2cc69912d8d7eecaf0be8e19baeedf3fd163b94e:
>
>    qcom: Update ADSP firmware for Glymur platform (2026-06-10 14:46:03
> +0530)
>
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: Update ADSP firmware for Glymur platform
>
>   WHENCE                   |   2 +-
>   qcom/glymur/adsp.mbn     | Bin 17049560 -> 17053656 bytes
>   qcom/glymur/adsp_dtb.mbn | Bin 225080 -> 225080 bytes
>   3 files changed, 1 insertion(+), 1 deletion(-)

I merged the previous version of the pull request. If there is
anything to be fixed, please send the fix.

BTW: Is there a chance you can start using gitlab directly instead of
sending the pull requests by email?

-- 
With best wishes
Dmitry
