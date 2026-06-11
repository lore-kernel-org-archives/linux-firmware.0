Return-Path: <SRS0=l1EM=EH=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE2CD98C7
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jun 2026 15:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C8761F00898; Thu, 11 Jun 2026 15:38:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781192302;
	b=lmeOJ6twvFLnjWYmAfYLLeuDkGywVtdCytPqn0j806Eib0hNcQC0UcFv5W1sLFLbcIOk
	 t5lxQeD5gajpH4wVtrYI8xdMEaBbLhoihbRz7dGIibICP5sbktwvo4ASyipHeE2sRn5/W
	 JC4CL7wtk1megbEkRWdMB1/g64PD7Li6WFtrn/wOuxru2fl61ggHODk7ZhwJRdQi0rM+z
	 YImIDMjXdHxamXXJaN4LKNERBKYqczr1kwdVntFbkgONOVR+PclXw+Id24TM20wpajgcr
	 QQ/dqT2hD6o+T8raRfG1PXPdP6tSXv2rgBSU2afSeHqZQVvz+eBIEnen9ckuQv9yD/w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781192302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T2g9ljgsArcayRG90QB8NEdqssVRYMaC/LRGDsh3uGs=;
	b=LRJX2DMz36PWMpmc7IZVENjmDmBe5XdN1Kl3QZSpKHmnON6xIoRDfhQrk0UQwSc0fjty
	 8ba9QObON947q2E0yweutJzeREqhBeduZytoC3JoN0vIoaXQvNh3wu7oKCKuZB5OxIVcU
	 cmrn0Ct6Wp8P0dDou24Hs9joLZwlFGKLEC44hVaHWUuf1VDevdqv9Y67hycnMiT0Kduin
	 yJu+yEy2/X3VC9q7fDWkCYTmMfKotvNndCbk2KcIId6Kvo0NZ54YS/7OmuajxAPu2O/kM
	 P2o5n6cPrriuRN276bgMs1py3fR/g79pYF6VwzDDNbZ5hzGIRTgFAQLMrH1YaBrI9zw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=my591qbL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJVJmc5M;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B33811F00893
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 15:38:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=my591qbL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJVJmc5M
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B33811F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BEsHH2956206
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 15:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T2g9ljgsArcayRG90QB8NEdq
	ssVRYMaC/LRGDsh3uGs=; b=my591qbLXFEpGzwdsgB7ZVyJfxfBvOjDAGiBva5i
	IJr8nkaD/WTDVzmOHfcdGbZ1NDKRpaDu/b0pV4NOWs5JajqEr8O1MvV4W7hut/W9
	wNzB2Ov0hjPv69LNhXUqmkf3iTSG2I9oGIs7eP2ba75DqMgf5I44ZDsT/SPz6MHW
	pWVfTkoqoBiTTrrQIR2D2ioYnoYhIf6sVLnE56biqRCFHX26Y5ZPCFvzHQfdaQ5t
	R//lNWXuWpnixfNFCtoR//n6QEhtGghLCIAm31XzIWAihZuSE335nvZhh2+43beT
	gHWo9SaIMrogqHvBLdftkAQ9dyF568KgDOyxHoxAaZdFow==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe70469t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 15:38:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so4363324a12.1
        for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 08:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781192300; cv=none;
        d=google.com; s=arc-20240605;
        b=CMlBMfl8DZwDunzKkxfcB0mKaNcmqbyesnjwT4SEme+r3Ar8OC3Zlkhv9E4/fa/B+4
         n+J46TfseDyt0vM3oEKEzen6ct5Frmom4z/4lBhiU6BiCmaw3qAgoeL38yy9xmsJ+xQL
         9dY9rbinGG2I7VSduMlT3pwDrb0uC8XFrOSlcdZQ9lkb8IWQlDrk8z5DRbGoFsbbGuND
         pEghD4mo/Bt7P4pG/umE+hamhFYtBW/BExxcvkboGH8i/jCpWlS5iDr8aKyXDM5GyMCv
         sFp+kOt4l0KzwgZddxciAvISX+ZPAhk15xkKBi2/2eeHraOW8jOc9EEFemhlcVl/3ic3
         mLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T2g9ljgsArcayRG90QB8NEdqssVRYMaC/LRGDsh3uGs=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=Jomf8O2+kwNQnkyj6VwuhhlwlwEqfGfMQ+VLqhwAECt98du3zwom57HIQoHXNBJx7U
         JdC3PY/NxMQWo2YSlNalz3dihoF0dagqULnQO7wZORznAoqalm4z/nCY6kl1rlXDyf+2
         dD1TpgdOgbBIPnvkv6pXUrz8mQvV52t0o1BZyFM8FWGN/up17Fd6gKY8VGM0Qe9/Quys
         j77NbW6dkl3h/iMll21mDhqexoHgI//ZdLsPFJVy8HuL+4TQd7n3skVcmK2ng3YiPGmS
         YXCgtq1hZCVWeZ8uprOAkuFmFrBF6U1Le5d+6OrRpYFAAHGZctdtqJlciwA2yhD0jrh4
         9Chg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781192300; x=1781797100; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2g9ljgsArcayRG90QB8NEdqssVRYMaC/LRGDsh3uGs=;
        b=dJVJmc5MBXBrfeA/8zP1bvIA91qxeAgqeoCbi8MrJmKeJgK0NR177FCFII9RrzwESR
         N0SOh4q5jqFPNWbnA4riF0Hx/UoxiwGgLY00wJV8Rhfm4WsAHYftgpSyyUIqpZq3rMua
         7XE0jossf1O7k1k54zQunUTxlft+5HPN91+YqdhrzAcWIEbxNM/PSLwoy5kEWovD8Y2Q
         i7bYjC1oa874FXYWJ9eML+OCWyMdxt9ox7fk44kkJwLHPxuhK+t2Q/0euNs0dxQzuAEZ
         1B0fy+dyzommuk+hSwnnFHKLwBKpGyOoWHZLcMIfQDgFfRrL4Dkd7Ijb+oAAoRY55W0H
         496g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781192300; x=1781797100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2g9ljgsArcayRG90QB8NEdqssVRYMaC/LRGDsh3uGs=;
        b=VLI++KsP5+HGabdtq5MgVs6ne4FEh/pXCTegcPD166Kmv54xnRfvxxWTTr8uCFdWzI
         SWXEOSYOPWLYWrLKySB7pBN0It4V0kzEZcPvMbB2ZYfxHqLY0Bqk4U9J671T5vLvG+8a
         adjziDCLAU4C4RyQTBPAZPi6F73Qx3nuOZehZVKGCkXLpM1WraDBniPctXIG4VcpFMQl
         r7E8znVT09Kdzfd0o4d7lO/zaIlinGBF7y02r6A/RFLrWQFRgr9EeMQi6GKkz6j1A70X
         j5vCfJyGD+AGv2PTmKC4CjQy1pN2tgxnNpGFmKpzn9tAjGzL92VFkOUmBY1RyyNDhphJ
         t5Lg==
X-Gm-Message-State: AOJu0Yz4gpI3WZZFl6VnefxkNCv45BkW65IEMtip/UWRi4OyHmPbzVtC
	qBcUdhh7rNNDjaAZ8SvgjfBysaDFuRPfFidrH3cNdkjDMuycuYKZMYkOpu93rKvjAYHRTRI4sek
	VCVQvngP6Pjb6Vw1Uq3HQnFsSZxKw6CI4+UN/2hXWg8924ZzFDwdaj54neE8+g+Nlu5qB2I62g1
	nuh+avqBI1AqXAH2+lJICDnA63hwobunjOR5B4pGg9ReR5Iw==
X-Gm-Gg: Acq92OFy8R5Cw6uxr6v2XHTTX8LHZnblBt2QhR9LjYUUDBDbV75lseTKUs7Tp2AcWC6
	/pn7zUUvikKBSd8HHUDYFLhg0hvT67XPMcNT94QRl9Ey6OsChL0EzBo033Qv+RvWAmin8MTtsE6
	8TnZ2MTllP8oWDeQBB+FFHs1UfbGxw7C1I/gwy2WERdJ/Xx6aRZX5W3ibzVqrLcQTfZ1uOMnSam
	Xujhwmf/K3axccN5c4L5ymq4XPBEsS+a0gJ3k30kg5eoTgL
X-Received: by 2002:a05:6a00:1807:b0:842:5b63:6116 with SMTP id d2e1a72fcca58-843367999bdmr3737287b3a.7.1781192299539;
        Thu, 11 Jun 2026 08:38:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1807:b0:842:5b63:6116 with SMTP id
 d2e1a72fcca58-843367999bdmr3737250b3a.7.1781192299002; Thu, 11 Jun 2026
 08:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <cd48d687-d403-4b40-b23c-8eb3d4f5708e@oss.qualcomm.com>
 <CAO9ioeVpdtrrp54wdFsk4AEoMzvFsPYJWgN8+nDdwFiAJaUt3Q@mail.gmail.com> <2058ea0a-1a06-4810-a564-e7ad6ab0ccde@oss.qualcomm.com>
In-Reply-To: <2058ea0a-1a06-4810-a564-e7ad6ab0ccde@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 18:38:08 +0300
X-Gm-Features: AVVi8CcTHuYgJCgKp5N5FupVRc_jxCLs8Ty14eimeuRqj2pCtf9TShrGSS36Pgw
Message-ID: <CAO9ioeUAiGw1UGPvX96ckYxhw5K817EjvMf3P2b8Q5-tZw3Q5Q@mail.gmail.com>
Subject: Re: qcom: Update ADSP firmware for Glymur platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: wZ1C4fmpIP0vpKTZVEES0F2wb4zopsdD
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2ad66c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=1ERdxhDqEc8Mfja-IKQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE1NyBTYWx0ZWRfX8D2xohE6GYjo
 PgvuBdTzbp+lV44F0E2HfWScInO7bPtq5+Nv6sS5fzwvyvXvJews7gbE6qxQZ0ju+n1iYOy8ey7
 DlDt5Jqc/t0SmDd/4KlvkClyCqzZnOVUkCCO+PNZZSVPek7IcM6VF81PtZ23G9y5+fBVXmEJD2m
 TUTI4iHDvljEgGuxsJdoL8GHtzjjKDma35mPrdRe3qTjiZgECr2waOWZoYK7WdkEZ1ftYQvOP83
 DNEMAGhMWjFClYdtks1pE6W9WDGZ1Wy4Bo8km9u1no34kccjRKi79Y1qFsAt2E9JuQKFPrZ/lwW
 c3JHAdKSKgZupqGjjX/C1QYBC5zTx0ByWJy9ndmqkWQ01sw0kJFOLFnL6BTfv0R5292lUTycQRa
 h4CqrXNVXrqA8TbY2Zk8FDwoGtRLkVi1Jw95R1ADcVRT36v9uwDgwKpUfgLt7LL2T5XZQkJtsaw
 Ct08GeKRF2mEZUepr4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE1NyBTYWx0ZWRfXzDiIpf/gd+cb
 DesVzOm1KMh94wDLDl/cc2Eru5ioGqSv53fc4Euh/Yy4DpwRdloSfJK9Su6EXVv2urP3H0brXG+
 EPLxFI9fsBkLaaDKsHyv1C436rPYpGQ=
X-Proofpoint-ORIG-GUID: wZ1C4fmpIP0vpKTZVEES0F2wb4zopsdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110157

On Thu, 11 Jun 2026 at 15:28, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
>
>
> On 6/10/2026 4:20 PM, Dmitry Baryshkov wrote:
> > On Wed, 10 Jun 2026 at 12:18, Venkata Kota
> > <venkata.kota@oss.qualcomm.com> wrote:
> >>
> >> The following changes since commit b672962ed4ea6f9de52bc7bf9e04e96585eb512d:
> >>
> >>     Merge branch 'superm1/unknown-license' into 'main' (2026-06-09
> >> 19:38:15 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> dspfw-qli-glymur
> >>
> >> for you to fetch changes up to 2cc69912d8d7eecaf0be8e19baeedf3fd163b94e:
> >>
> >>     qcom: Update ADSP firmware for Glymur platform (2026-06-10 14:46:03
> >> +0530)
> >>
> >> ----------------------------------------------------------------
> >> Venkata Kota (1):
> >>         qcom: Update ADSP firmware for Glymur platform
> >>
> >>    WHENCE                   |   2 +-
> >>    qcom/glymur/adsp.mbn     | Bin 17049560 -> 17053656 bytes
> >>    qcom/glymur/adsp_dtb.mbn | Bin 225080 -> 225080 bytes
> >>    3 files changed, 1 insertion(+), 1 deletion(-)
> >
> > I merged the previous version of the pull request. If there is
> > anything to be fixed, please send the fix.
> >
> > BTW: Is there a chance you can start using gitlab directly instead of
> > sending the pull requests by email?
>
> Thank you.
> We were not able to get this done. IT team was busy back then and now we
> got busy. Will start another conversation with them on this.

It has nothing to do with IT.

-- 
With best wishes
Dmitry
