Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F21DC432BE
	for <linux-firmware@archiver.kernel.org>; Tue, 31 Aug 2021 00:28:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A0E961004; Tue, 31 Aug 2021 00:28:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 539AD60F44
	for <linux-firmware@kernel.org>; Tue, 31 Aug 2021 00:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630369713;
	bh=Q8wcooRgzfCrPWVE7Fr8qb1mFZdB3I9mIgofIddsYfI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nEC8fBkb85iW7WBtChB/csJ9fhIfWwucp7WrNksWd3U5F0IOEaQWrTbcgSHbTaaqv
	 MknkVADprmh4K9uEwkLLyKzbSzQ/wXjCqiRKKaT2j35iLAStRpUEQHRJesE1nFYXqS
	 +k2UcOYRFLvVbg4NA3I0Anp88C4T13wqiinQBnK3dyIk+V3cNxythSEc+nQI7C8tVK
	 d0CAXG18Vz5h+XdJssQSTZhGdOkStYxtcgVleKwoKiX+PotBm3U2MGNOFmhEWu4EVt
	 TxFdyvaoetHQAu/SqMQt4bj1FzZN9G2cJ2BsqX8xZLjNMgW4aSq2T5XGhSeD6q810E
	 Xv/AM+MdrMTKA==
Received: by mail-io1-f47.google.com with SMTP id b200so22513996iof.13
        for <linux-firmware@kernel.org>; Mon, 30 Aug 2021 17:28:33 -0700 (PDT)
X-Gm-Message-State: AOAM530nVOYX1FSMzVAb4AkfqQ1A4thtJ6rt9ijfjFSHXtORCCWC9Nvw
	8sE0ofK8AomTnyMQQcFKgay4aJN4sPfEvosl4bw=
X-Google-Smtp-Source: ABdhPJwmaAil93fZIN42eklFs2F3sQNSvDDDDUH8dvP5tqSM77DLvPnjayR2wycViqsRTgt+cwJSSMz2TFRDhs+yhgg=
X-Received: by 2002:a02:90d0:: with SMTP id c16mr260655jag.106.1630369712862;
 Mon, 30 Aug 2021 17:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210819125822.6899-380-nic_swsd@realtek.com>
In-Reply-To: <20210819125822.6899-380-nic_swsd@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 30 Aug 2021 20:27:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA47g24XAj7b3KiaqiG=D-mf0QH5UQ154mrEQDAbwkWZTg@mail.gmail.com>
Message-ID: <CA+5PVA47g24XAj7b3KiaqiG=D-mf0QH5UQ154mrEQDAbwkWZTg@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] rtl_nic: update firmware of RTL8153C
To: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Thu, Aug 19, 2021 at 8:59 AM Hayes Wang <hayeswang@realtek.com> wrote:
>
> - rtl8153c-1 v2 08/19/21:
>     1. Update the firmware of RTL_FW_USB.
>     2. Set bp_en_addr of RTL_FW_PLA to 0xfc48.
>
> Signed-off-by: Hayes Wang <hayeswang@realtek.com>
> ---
>  rtl_nic/rtl8153c-1.fw | Bin 816 -> 832 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_nic/rtl8153c-1.fw b/rtl_nic/rtl8153c-1.fw
> index 5c3d1c468e5307c588ff347b57f7d0ca719f8341..e2b5d74f8c051a8bb4eefc1d742388701b5aa015 100644
> GIT binary patch
> delta 224
> zcmdnMc7QFxq>sDKZB4b|<Az(|@`4U4KkRudH|HMLs{d=u6wf>_xLs6|V_|4&oUCi8
> zP-diHV4-hlsc&S+00&G!)(1ugh6DzNXKH^K7I^&OXVCb=!f;OER*VV98|jIO(k=|w
> z&odbr7#YSJ7#kYJ2l<$p8(KQXr{xzVr^b5(#}_1)Bxf)PJg9sy{lUx!3mz<bu;jtA
> z2P+<|da&lfx(6E`Y<jTe!M2UtB^d=A5*j=jJ(@fmI+zYI?D`-*`2wTN<X=oWf<Ol_
> UZ~%!228JI%S2TD`He~t_0AJNrX#fBK
>
> delta 205
> zcmX@Wwt+29E63&t=i_A6`yHVR7j3>jOG|o#lN`&Y>ir?+Rwn(mK}97w7KWzA$-0IL
> zWrhj{#`?yF`bLHfaKHp)Jz!*Dh+trNruK(nfyW<q28}<=4CfSX#h7qROq8|*D!6{0
> zF*MjIJ|M9qIV0XVKP5H3xGc}u*u<Qn`@g`0$_LXQ%zQBW!Q2P)A1r*Z_`%W#%O9+K
> vu=>H;2kRef+_+zoaq>GxvC01!*?`zcn1KOk8v_T#${#>08!RR}GW`bt*oI66
>
> --
> 2.31.1
>
