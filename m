Return-Path: <SRS0=C1ju=EB=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D1FCD6E7C
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Jun 2026 17:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 974361F00898; Fri,  5 Jun 2026 17:41:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780681280;
	b=H65nIeYz18QHiyRk5dqzhtFrgx5iuzcm7UOxjkDiS4DYxoil7hm309cJAeh4lbGdZzoP
	 +K3Ua5kZ3TDjfcSIymc3fiNOG/JALDgNobZlU9U8iAj9zEy/kjUKVu2nf1hxRjseoTaBU
	 RWxwv4ezqKV8ffcM04052CN42ENo7NswEsmHnCZiMhkBdDlVYwDPwwNWYNLbuFRIM37jo
	 3ZHBC7XtkHFfCMxxou1Cs0jBBkG/GhR22ZFZtZ+q/JLl5UiG8msSj5VuDOhKclvUAq93y
	 B9CR0DGKBLETUHaclYNtQX948hFpJ1CwuxaJh18tZuoKvD6wpG6B8dFuu9u+FUPoZJA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780681280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q97UYEVGB5HJp8oVq3iL1T0ylBngLjyG9kyhZUBg/Ag=;
	b=SSip0meD/jFsOBk/iBCXfcI7ptkQbyStMReGzZRh7PAKH4J/1RupdO1xzp+MGcHTs7fb
	 AS1mGA3eNB3lih/FSlf84ZAREF0Jx+4TETs7wg3uh00m3jkE0yBwkgmJXlYxxpNErHhjF
	 OfFyQkTLttRChn2mqvE4aw2aJe/u1AACL+GJ4Jv9Sv0jcQCoTXwfHNisUcBLUcj0FmxbK
	 siJTIeS7lBKsNiz7v2GRuv5c3YXqdf1vWpvTFWjsrfG/P3c4tdep+wV1vvWmR8SasK3j5
	 5YNhHxqSJYzgjxfgCg4RCQMQr6B2P6VyBoM8aNQYhYx+c9aiP9H5t7wOAt+IUk9c2SQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fF0K8TeB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b6qpDguU;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7E751F00893
	for <linux-firmware@kernel.org>; Fri,  5 Jun 2026 17:41:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fF0K8TeB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b6qpDguU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D7E751F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655GZ3p32975474
	for <linux-firmware@kernel.org>; Fri, 5 Jun 2026 17:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q97UYEVGB5HJp8oVq3iL1T0y
	lBngLjyG9kyhZUBg/Ag=; b=fF0K8TeB2s1GE3ou7KTY8vlc0CYn7fGUmPsBEPMr
	K4nT0ZRKG4f5KqMV6NadwNI5fSY/DL/NhrIuKkyvDM0rO2uzWMIWJs/5NabcZCuw
	tm0uarmdx8pVAU5l7OVZvPflZ7xUq5DHiGDE4GmWwU/wVZYyL8BLOBY4EgNYlsnM
	JXPCjw01WiIRH9o+F63sP1FBckyYv9kGtLzCWoPxdTALQcu6ciVlQIqYbIg/4aRn
	/nw+eKcDFP9v8bnlAUSz4Thi5Rq/5oz2gbJfq9JQuuqa8YsLNEHAEwIxFlsJFsqT
	HW9IIxeWy1kuCJE4529miqe981cHpnp+GzmpraA/DkfmLA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnubkcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 17:41:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso2556517a91.1
        for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 10:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780681278; cv=none;
        d=google.com; s=arc-20240605;
        b=KtZ14iFSx2MhUESB6Ev1+5Kt0DlIPdyg3pO5O0UAeBruB0NvvMs3bvp3B3FN8KijNI
         Urz7n3zCmvm1/5wwBq063mCsPT7Llu8Rqq2B5188rog8nZGs5Yq9hdYsbRI1Py27flAm
         HSdNBwMNr90h/cFWw1UFmM2zjpoj3+4T/zAlHU1zOmS+udo2/77lPfz/zL+gAO0HYFtc
         JF205RuW8+e+k1W/yWqQ30PjN98gMydxg/I4xUBN7Z2uW83b2hgOXkyDWeGaVa9H6TTI
         P6184e22A73LNhMkQg5aNk1cOrU1Xi9xYLiVis/vlVdY56CG8VeT6mxwuk+GWw+vdrJv
         3o6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q97UYEVGB5HJp8oVq3iL1T0ylBngLjyG9kyhZUBg/Ag=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=BOpoh0ShvBfGxY+RXPqKCR7xYjJQEXmlQ/qDz94Uv8TiDbZcfT0T3rK/TmzSUHFaOc
         HhKtOstlA32FLdBY0+g7ROSpigRG041GZWvR6zNc58bHiCI4AYKfGwynZJO7wPp9VizR
         a2+XEhchgEDv3ZM/tFKr3YOEjfzD3PWFTbohlTBad39fwEkSgJpTYIVviMkLpMfqVObF
         ytALsupFK1aON+opodtG96wR+JwHZt/xl7rt2bbx1y/h9GNhvqKzR/Un9T3NFLNf1v3G
         thRV9tHfkcNl0SzoU99ZREfD1nd1VSd2MppIJjGamUCPubZXBY7zx5aRqaeoTbNPECrT
         MzuA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780681278; x=1781286078; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q97UYEVGB5HJp8oVq3iL1T0ylBngLjyG9kyhZUBg/Ag=;
        b=b6qpDguUFmE1q1RS0DsrCegLgF/Z+haJXv1ImvaA5QwOSkw+S5k8XEuOBiI6qofKBt
         jZH0535EdG3mCtp1rkRytXqpZtv3MgRV7UQ+S0cTpvu3WwwUVa4npw6hfkQowI7IX+ew
         Wzhl51peN2CDOQl93qz1NpPBLwjmnLuS7Hg61mhOHAzvW8ZtwGyXxOOCPFIYu6ZrfSAz
         CRYf4HluVE2djAroYaMaagqEERVFCb7jhjaYWS9A0XbF/72Vg5gUyU5c3uSNTn+4fpBh
         K3Ivk33GjCA3GaauvX78e9wJ+3yX6QqSuPzX58QRlnADD/L1L8H+Ig1KDUl0AJNFG5lh
         YcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780681278; x=1781286078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q97UYEVGB5HJp8oVq3iL1T0ylBngLjyG9kyhZUBg/Ag=;
        b=awys5S4WFUrDr0/lPMncH6+TRjJKEvKXbqvRoxqYgOR1xZDE2eLeMC1sLxEwj+/g6V
         NNZTMN41gj1JQJqJxt9VBGs0Ij9C5ah9/XwsaCzPkC7cdL9QK5281WKn550nk0jDkCDZ
         vmFCLM872dYbh6Z/qIrrKlzS5f6ejeOoCPYtCM4C2hspQt5NftvC/AXjLPfZgKvOCXVN
         z/9EE76C5a9EzOBXC7AWQab8qwbvLNHPEABGeXa2jZU4I8Kx+jSXSjfvb9nuVin9uXhI
         gPcPhKx0qO3MFVCuCvK+AsLok8iABg7t/ai4HOHqFV9yw8XQn46yaVnUUPKbONphqTy2
         ezVA==
X-Gm-Message-State: AOJu0Yz79XDimWaJy5AlA+vDSOW1aTxJLC4RBBHmS8XcxGW2MZNjE7OG
	bLneH1NdUQwvSlsPH6a4ewzMtqnXmGlh1Xbx85lgQHRNXrYQMLxZs1Zed8eCPYEVNJdmIHjoRmd
	HHu5+BegJt1hJKTwibRD1S/U/1AFsrRnc6ih950txrAFLF+tJLdE1lW3KYO2JJ5SyrlA4UgFkW2
	gWW36gaOp7kLygeUU0QkIFtqAve3DQmRKGqbteAg==
X-Gm-Gg: Acq92OGec96q7WMlKxrzjCtCQbYaJVrtT8c6rwwX+d4bxmco+/B841OtnsuqBlQOUXs
	k0Axj8vsuxVKVeQmSvFMN69Q6VQfb1lAEgj/fPp2tf0mzn6oB/y0HUWBQeOk5KKzcllgUgqaRt+
	w9v0HvEDWthXiKe1leiUjZVYgY/dK6UTvR41FdVOCMiFJTPZMGIxu1/jHQyFbl/gtm1gDvbQ9UJ
	1bgGmsPaJu2G/Gxcy/PYKJH3KcNGcVkzy5ptKbv8q+izjX3
X-Received: by 2002:a17:902:d103:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2c1e78dfef5mr32164485ad.5.1780681277442;
        Fri, 05 Jun 2026 10:41:17 -0700 (PDT)
X-Received: by 2002:a17:902:d103:b0:2b4:5f96:184d with SMTP id
 d9443c01a7336-2c1e78dfef5mr32164275ad.5.1780681276898; Fri, 05 Jun 2026
 10:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <c5d3951d-dd2b-449d-9850-7a4a0f0e680f@oss.qualcomm.com>
 <CAO9ioeX_kSma8sZOqqVBvDRdoqGqKSUzH+GJK6+9qj_=hX9qpg@mail.gmail.com> <57d9514a-ef53-44c8-bfe4-36e5ab14c2ce@oss.qualcomm.com>
In-Reply-To: <57d9514a-ef53-44c8-bfe4-36e5ab14c2ce@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 20:41:05 +0300
X-Gm-Features: AVHnY4JOAbEgnYVLLFONX2tDMPie0UA_8iQlt4g-YfhRZ_za4nU6mywl2vP4tgk
Message-ID: <CAO9ioeWk5arGw=hCD-X4=VZFqA6iPB1wxMsnNmgTV5Rt0DCrxw@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: mJBvbRvIC8Ii1YKgWCzjrcm7vYnb5GFf
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a230a3e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=jKG1yqHmReV8litFb_UA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDE3NCBTYWx0ZWRfX1hCl4C3F98Gp
 vkrYHH9GmCC09qcsbiG3BIJBfSIoZxyfH2cPqklFoBja6Ri+HWEGPQ2iYdROfg3883GdgQiEE//
 YRhsfQj/PpzltJNeL+KR5CMTYE4xfitAnkMh5zH5QfoGPEJ90yn4TaDo9EoXx3HirEZHDWWxDRl
 3UJOTjxIZNuQWg3s7lyX6N4z0Mp6tl21r4bgfN1VycTXSzQVfox1IJxDkWaMDxLgbXwlUvRwRap
 PJzDXMBtRWBVTj0IFYctAYIQWcS26q8u8/PHAnOH43D89y5WwvskWXTRUtedvUDTNT3auJ/iAvB
 sA4G8ogYebiNsQluwQEGVNz7mC0YwUb6dRDP5IAkz/oxwi26jKpsKvNGKUOEws/0wPPmO24/7Kv
 Xl2tf4oOAu8gx5myPhwDQyodhsJMNNzAakX8zdKEQGLWgVwIjeHGBrXeTgIxScJ3yTPDLooctsh
 +fUwrcHwXNOlHT7u5zw==
X-Proofpoint-ORIG-GUID: mJBvbRvIC8Ii1YKgWCzjrcm7vYnb5GFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050174

On Fri, 5 Jun 2026 at 18:18, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>
>
>
> On 6/5/2026 6:41 PM, Dmitry Baryshkov wrote:
> > On Fri, 5 Jun 2026 at 09:47, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
> >>
> >>    Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> dspfw-qli-lemans
> >>
> >> for you to fetch changes up to 8ce6db8cd6564895827c199635fd94401a9d4d98:
> >>
> >>     qcom: Update DSP firmware for sa8775p platform (2026-06-05 12:11:41
> >> +0530)
> >
> >> Changes to support Ubuntu 24.04 and Python3.12
> >
> > What does it mean? How does firmware support Ubuntu or Python versions?
>
> Noted. Firmware does not support. The tools used with in the build
> updated to work with this updated Ubuntu and Python versions. This was
> an effort to move all the tools with qcom to move to a uniform toolset
> across.

If it includes only the build-time changes, what is the point for
upgrading the binaries?


-- 
With best wishes
Dmitry
