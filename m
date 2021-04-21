Return-Path: <SRS0=2DKb=JS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F0AC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Apr 2021 11:21:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49C3861424
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Apr 2021 11:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49C3861424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f+4tMEw2iXHsWe3OXDjOEr7nI2K3pC3RMthynH1p3eQ=; b=k4QRaAYYDQdELDID+dZodXgr0
	sTGqtjEvchbzdlZA6Y80irgiaW6aKlr4ilrCUVQVjXfJmriH/ZPpOy+PgFUBPtRF3zR4oJGWcxuZ0
	J0MfQVIc8TZ1h1DIr1ZHnWMWLc6QhFqLdo6zF42Dd7/OVVyyJKW3lI87yEoXAGUYgvps3blqwoaNa
	ZBrR8G0Y1FVR3eiCfmVwxyZ33uA+Jsw6sUo0kugZbtKYa5sC9LHnWglk9IvnKE6oxSaa65YDerrXb
	WCzntJb9254lG3pwUGwu6qunDtEp5l0lNatPWy/ZAkwqMzbgCH7ZSKbeqaOdSgzCkU5of6rVATP68
	uPCXunlUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZAss-00EIP4-2m; Wed, 21 Apr 2021 11:19:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAso-00EIOn-DU
 for linux-arm-kernel@desiato.infradead.org; Wed, 21 Apr 2021 11:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wZv4ZLyRmPR8X/NfrIDrPHwR7eYDKLJXb1G8f6zDfKU=; b=e9PkkT8PAf6BXzo1ndUZV7Ndkf
 L8W28J5b4OKtE8GCBGC+WgjjtvCNxQTvCMb2ezHYPHVBrvlJn2LdveGS9TCYQgri0xAyRbI9bTqNr
 nLhWpki3XshrHjaAwNE3Y3PS8HsnJcrtxK7P63aC76CcjFpqWuqZr7tezjGs+0imFhuzm9S0PNsyw
 0uvZrP8678JoC/kMIUIDOiP5kyIp3BBvxQOfFoEc/9Fudtac+6Y0EL/j114mJQi8LsPqF/4bGuPhk
 /G1jrai1M9d0O18bS+xcYzvCO0zbMotYgBleceEEtBvidXC4U2M1gPuL10KaJ6+SDPO8ozLjp2F33
 aRcm3akw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAsl-00Cpjn-Id
 for linux-arm-kernel@lists.infradead.org; Wed, 21 Apr 2021 11:19:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1366C61424
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 21 Apr 2021 11:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619003938;
 bh=RcszqSY2tlZTXVDOySigDOvB3yWfQIlsYcm95tWSKxU=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=AW+tZ15lroVMdItxtrnK62fGjJFEfqbMX2tnSkm5W51u+GeWsSp/PvrtKngSP6r1r
 ONyj84WC8nPpdAg3TTKdehpHsCPipX+JcCl12NlGy7w4CB7xZOQerbvy00TwmVqhD7
 XCjE2DuxQtfy6C9XM7Rc97mYPN1KDkkQvW4i+KhFaHvVcNg/LDQ3BNwydcKLXq9alO
 aGd655avdjP1cCm6r7fIxMeHAbfdETBNWfGlmaro612m7xgHj2vs8P6zc+4THj3t1B
 vnSqm016ArW6Wo4EjeUD71XLfh+vGmIGn9Ry3yW0RCB9Rfk/YkecHN3ub1FvbzI7UV
 1n4WdfHhOBCPQ==
Received: by mail-il1-f180.google.com with SMTP id b17so34611356ilh.6
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 21 Apr 2021 04:18:58 -0700 (PDT)
X-Gm-Message-State: AOAM5339B1aDxLxEVrTN3X1b58/TAdizDZe5+eJ/7vk7T8jH3hX2omOi
 fEDTVhQ7hue9zwVtpuNgEhXv3WyjJ8Z2/QN0VZM=
X-Google-Smtp-Source: ABdhPJxSIaorbaY8Obvjcma3z/nV5e/e4p7itwWm8IiQ1Ik688W06y22OctyidUtgN+5O4L9kB4YAFuUOUrYTj6MHGY=
X-Received: by 2002:a92:cd43:: with SMTP id v3mr26154803ilq.11.1619003937329; 
 Wed, 21 Apr 2021 04:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <8885c6fbfcc91043a5406cf6e528e0b9@codeaurora.org>
In-Reply-To: <8885c6fbfcc91043a5406cf6e528e0b9@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 21 Apr 2021 07:18:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7pbgVRpwkM71ToxRwBKfH=j51GrZcz+8Q5H2MpmmL-_w@mail.gmail.com>
Message-ID: <CA+5PVA7pbgVRpwkM71ToxRwBKfH=j51GrZcz+8Q5H2MpmmL-_w@mail.gmail.com>
Subject: Re: Request to update venus-5.10 FW files
To: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media-owner@vger.kernel.org, 
 vgarodia@codeaurora.org, dikshita@codeaurora.org, adhudase@codeaurora.org, 
 sampnimm@codeaurora.org, mansur@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_041859_724247_81C32989 
X-CRM114-Status: GOOD (  19.49  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421111846.G_mtcitrxVqRuFm-pZM3kKELTPOIO7VEMGEpWofj5og@z>

On Wed, Apr 21, 2021 at 2:59 AM <smagar@codeaurora.org> wrote:
>
> Hello Team,
>
> Please include updated firmware bins for venus-5.10.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
>
>
> The following changes since commit
> 5c893c65b862906a627cea238ae8c2d099027dee:
>
>    Updated Venus firmware files for v5.10 (2021-04-20 11:48:28 +0530)
>
> are available in the git repository at:
>
>    https://github.com/suraj714/linux-firmware-venus.git master
>
> for you to fetch changes up to 2565c9d2576ce1275206483e106d6fb627ace042:
>
>    qcom :venus_v5.10: updated venus firmware files for v5.10 (2021-04-21
> 12:04:59 +0530)
>
> ----------------------------------------------------------------
> smagar (1):
>        qcom :venus_v5.10: updated venus firmware files for v5.10
>
>   qcom/sc7280/vpu20_1v.b00          | Bin 0 -> 692 bytes
>   qcom/sc7280/vpu20_1v.b01          | Bin 0 -> 7376 bytes
>   qcom/sc7280/vpu20_1v.b02          | Bin 0 -> 300 bytes
>   qcom/sc7280/vpu20_1v.b03          | Bin 0 -> 20 bytes
>   qcom/sc7280/vpu20_1v.b04          | Bin 0 -> 20 bytes
>   qcom/sc7280/vpu20_1v.b05          | Bin 0 -> 20 bytes
>   qcom/sc7280/vpu20_1v.b06          | Bin 0 -> 20 bytes
>   qcom/sc7280/vpu20_1v.b07          | Bin 0 -> 24 bytes
>   qcom/sc7280/vpu20_1v.b08          | Bin 0 -> 16 bytes
>   qcom/sc7280/vpu20_1v.b09          | Bin 0 -> 939184 bytes
>   qcom/sc7280/vpu20_1v.b10          | Bin 0 -> 42976 bytes
>   qcom/sc7280/vpu20_1v.b11          |   0
>   qcom/sc7280/vpu20_1v.b12          |   0
>   qcom/sc7280/vpu20_1v.b13          |   0
>   qcom/sc7280/vpu20_1v.b14          |   0
>   qcom/sc7280/vpu20_1v.b15          |   0
>   qcom/sc7280/vpu20_1v.b16          |   0
>   qcom/sc7280/vpu20_1v.b17          |   0
>   qcom/sc7280/vpu20_1v.b18          |   0
>   qcom/sc7280/vpu20_1v.b19          |   1 +
>   qcom/sc7280/vpu20_1v.mbn          | Bin 0 -> 2031188 bytes
>   qcom/sc7280/vpu20_1v.mdt          | Bin 0 -> 8068 bytes
>   qcom/sc7280/vpu20_1v_unsigned.mbn | Bin 0 -> 2031188 bytes

This looks weird.  You're adding 23 new files, none of which are
mentioned in WHENCE.  Also, why do you have a bunch of 0 byte files?

Is this correct?

josh

>   23 files changed, 1 insertion(+)
>   create mode 100644 qcom/sc7280/vpu20_1v.b00
>   create mode 100644 qcom/sc7280/vpu20_1v.b01
>   create mode 100644 qcom/sc7280/vpu20_1v.b02
>   create mode 100644 qcom/sc7280/vpu20_1v.b03
>   create mode 100644 qcom/sc7280/vpu20_1v.b04
>   create mode 100644 qcom/sc7280/vpu20_1v.b05
>   create mode 100644 qcom/sc7280/vpu20_1v.b06
>   create mode 100644 qcom/sc7280/vpu20_1v.b07
>   create mode 100644 qcom/sc7280/vpu20_1v.b08
>   create mode 100644 qcom/sc7280/vpu20_1v.b09
>   create mode 100644 qcom/sc7280/vpu20_1v.b10
>   create mode 100644 qcom/sc7280/vpu20_1v.b11
>   create mode 100644 qcom/sc7280/vpu20_1v.b12
>   create mode 100644 qcom/sc7280/vpu20_1v.b13
>   create mode 100644 qcom/sc7280/vpu20_1v.b14
>   create mode 100644 qcom/sc7280/vpu20_1v.b15
>   create mode 100644 qcom/sc7280/vpu20_1v.b16
>   create mode 100644 qcom/sc7280/vpu20_1v.b17
>   create mode 100644 qcom/sc7280/vpu20_1v.b18
>   create mode 100644 qcom/sc7280/vpu20_1v.b19
>   create mode 100644 qcom/sc7280/vpu20_1v.mbn
>   create mode 100644 qcom/sc7280/vpu20_1v.mdt
>   create mode 100644 qcom/sc7280/vpu20_1v_unsigned.mbn
>
> Regards,
> Suraj Magar

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
