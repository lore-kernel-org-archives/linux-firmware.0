Return-Path: <SRS0=eOPl=DD=gmail.com=yangsunyun1993@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C04CD3436
	for <linux-firmware@archiver.kernel.org>; Wed,  6 May 2026 12:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C4E8C2BCC4; Wed,  6 May 2026 12:02:01 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9044C2BCB8
	for <linux-firmware@kernel.org>; Wed,  6 May 2026 12:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9044C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-47c35be031dso3746291b6e.3
        for <linux-firmware@kernel.org>; Wed, 06 May 2026 05:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778068919; cv=none;
        d=google.com; s=arc-20240605;
        b=NJlrjYI13JbPvxhG0addf8/+aYGXdmFDbHOBhkhOBSH1G/lPhnuG49l1NxNlQ+6qqw
         5t55xY9uyXxdUoVIyuIcyMjoBgH+h2aWEMN1B537s8EDcJliOnzGip6QuBTelTiuQGHM
         uX+RN4Z3HW6CAOQz+V56DdUYciK3mKtqruugRLync1jG4XG1cAacWeHjOSppL9H2ZBj1
         T75/4noDY9mO6fIY7hg8uc7f2rbvhm15TIfC0DIWixcEx2AzLjpQkEhH38rEcKi8geQ6
         V1r1OFhTgdJ9q5XlF99X5VqD04KSYIO/HQ1qMY9QhajhnpR3pmx43CHVd4NuqheSDMML
         alBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WMrxqjDRyVCgWkXbzwweLm40E/lbjKojvdIa0Np9FyU=;
        fh=0GLpMHTIv7rCrT5/5ny8uia7Ni6XgWplZ6mvofLpPbk=;
        b=R34AglQG+JCZWp7II8TugDIKSaTqLyWKVH7XGvDKZj1mLR4dHXdz5wIhs4nWtgbysU
         PlE6u7X+sv178DUhFFB8vw2LbVr5S5lp5Mhj5LWPJyoFrQVnO23dfFfnXODfZ2Hx/Vjw
         EXdMB6sQu/8763veYp6jKZ6g1dBsHiyRPO/mHNiiGvrc8hxYBFu0cuomnt3Ekf6imivc
         rCKzs8S+IwDsM4TyO25uXCxmUiwjvV6HQMgevjH8AD32t2xOMdXkSLqV/X+R9Ut1UGT3
         mrmhmDcnqWcJ1My9XeMg+lsAPZD+JRucNJTqa365KcSrSuIiUpPGifjHUgbcQYbFXaoe
         0Lew==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778068919; x=1778673719; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMrxqjDRyVCgWkXbzwweLm40E/lbjKojvdIa0Np9FyU=;
        b=cctmKVoNQBtbgimL6c4YHeDgTgqH6zOtLd2eO5YzdRKrfEhJr+nzzH81CIXWolaSaT
         AIKBvvthLXyxienIFUu+l/KcJ1upKgXtAC6m0DQfCSuN9jlQoyUa3YEmmBRBc3ShYUbh
         RDP/5NVCPpk/1jTNfrAPcB8UUPV1mADyl2fK6hs8ZFZQY19XB4SyNKfLn6bWNw+JIpn9
         2VoStLdV+0N5yIzt9PESsIkvP2sgAgmTHBy74bsJoPgSCjKReDcONIgQwjHSPHquHnAD
         3maxZTOIkLTgMq0M4+OWInZWv+e0ABzAk6198GXhhao7l2eRgiNT/O86TOhS4D4+7/X6
         exlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068919; x=1778673719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WMrxqjDRyVCgWkXbzwweLm40E/lbjKojvdIa0Np9FyU=;
        b=ZdT4ET6ZSg58yPWuJCYMk7jv4N2jTySugAb25i/ZLPmPOJWIqZ/rmZHrBDAdlm+fkG
         LfnGZ7g18PrUYrZyyoXjvlefEMQJQ0+vZ9NgiPsRWUM1VHspRIvzDhYJKVwfct81/OO9
         M7xW7PQflXzoSAA/WsLKSsqmCknmaaAT2Zs+MVeDub77UrqAKRRGKpGjVOkz/WbiSoLD
         kSiU0dsRSSIMh8gdlTuuB9lG2YasOXZNtwCyhHZBZhjZzrVUCZcrUslpSEXDpr+Mivqh
         w5DwasrPryT3IqJzxmy6jjnYu0EcdBKYeWlTtKlxPGxF1i8aCjOZvCKAMgs849qanuLe
         j54g==
X-Forwarded-Encrypted: i=1; AFNElJ8ozQKFgi5bY2icGNBPc+rwF6FobDCP3NY6eL318gHVRJJDojei6GvhEcKpZNzcDWSTfT9/3OABLhKxBWp2oQ==@kernel.org
X-Gm-Message-State: AOJu0YwwQOK6/10WLuRDNVoBYjpbBLydFkOqKkA0EGzD0ptU0cU2XdHS
	i6LxEAMVhBrbNCTfqqLH78/UU41onVXME3BX0lVtf23yWEqHJwqBGMUdAVxo7J3h2Akg5js2vMz
	iEsOdIKyil7w4oiKrPxea0nmf2ZXMqHQ=
X-Gm-Gg: AeBDievKAsdZrDU6WH4iMnfE484KeFLbzFR6Uxo2VTWlrqMT2FgYGG4qDmFgGy/Jrij
	sgU7rsY4ZS/eADyF7mYq403jlll9wWfoeLp9uzWyHKckHv/p1L3gClgslNhjqzFc6bS9VIjakGR
	ih28UGjQMMhBl3DVnjzM0XC01pvMYGUbOVRiWdsnzb4ITGwjNt5XrA54jZL+PrNW/IYtTfT1WsU
	J9NQ/c3JME6TRYSYHEbBuf4yxWz89m1X2auzvm84g8Z0DJ56gXfFsbNVKnr9ZppNCCWA3w/q8uB
	3hejsBi5Trf64IJ1FA==
X-Received: by 2002:a05:6808:3a17:b0:479:ead7:2a5a with SMTP id
 5614622812f47-480420d7c0cmr1861216b6e.11.1778068918794; Wed, 06 May 2026
 05:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260506104934.82275-1-syyang@lontium.com> <CAO9ioeVBF2O9sRT+KzMETvYuV5Jw0okj6MiM1sxVdc5j8Pdk3w@mail.gmail.com>
 <CAFQXuNbA-wW-ZyqZKjRagA+qpPMP7AAtaX67Y4=AHOx23s2SEg@mail.gmail.com>
In-Reply-To: <CAFQXuNbA-wW-ZyqZKjRagA+qpPMP7AAtaX67Y4=AHOx23s2SEg@mail.gmail.com>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Wed, 6 May 2026 20:01:46 +0800
X-Gm-Features: AVHnY4J-63DL79Ju-58-idG0lhCyAkcd9PXaPajetMEkDGwyywQ4BPYdF9JVNGQ
Message-ID: <CAFQXuNbWQQN0U+s0K2XV7hy6ow3x7RAB8Q=nxOvsWENDAE=2VQ@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: Add firmware for Lontium LT9611C
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: syyang@lontium.com, linux-firmware@kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E6=9D=A8=E5=AD=99=E8=BF=90 <yangsunyun1993@gmail.com> =E4=BA=8E2026=E5=B9=
=B45=E6=9C=886=E6=97=A5=E5=91=A8=E4=B8=89 19:55=E5=86=99=E9=81=93=EF=BC=9A
>
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=
=B45=E6=9C=886=E6=97=A5=E5=91=A8=E4=B8=89 19:46=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 6 May 2026 at 13:49, <syyang@lontium.com> wrote:
> > >
> > > From: Sunyun Yang <syyang@lontium.com>
> > >
> > > This is the firmware for the Lontium LT9611C,
> > > which implements the function of converting MIPI DSI to HDMI.
> > >
> > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > ---
> > > Change in v2:
> > > - WHENCE
> > >  1. Modify lt9611c_fw.bin to Lontium/lt9611c_fw.bin in the WHENCE fil=
e.
> > > - Link to v1: https://lore.kernel.org/all/20260506100242.79276-1-syya=
ng@lontium.com/
> >
> > Why? The rest of the Lontium firmware is in the root directory. The
> > driver also (IIRC) expects the firmware in the root firmware
> > directory.
> >
>
> Our intention is to place all Lontium firmware in the Lontium/
> directory for the following reasons:
>
> 1. To distinguish them from other companies' firmware files=EF=BC=8Csuch =
as
> rockchip, qcom.
>
> 2. To keep the root directory cleaner and more organized.
>
3. Clear organizational structure
4. Avoid root directory bloat
5. Improve readability

That's what I think.

> >
> >
> > --
> > With best wishes
> > Dmitry
