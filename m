Return-Path: <SRS0=B/ZF=GD=gmail.com=cyrozap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E054CDB474
	for <linux-firmware@archiver.kernel.org>; Sat, 21 Oct 2023 03:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B52C1C433C9; Sat, 21 Oct 2023 03:11:29 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 588BFC433C7
	for <linux-firmware@kernel.org>; Sat, 21 Oct 2023 03:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 588BFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-27cefb5ae1fso1030769a91.3
        for <linux-firmware@kernel.org>; Fri, 20 Oct 2023 20:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697857886; x=1698462686; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBGgcSahe6pso8Cm0aFvPdVOr6UNqZiyFa2q1//pNtM=;
        b=LNyPvlAQoeC6t6d+12zoxtkAZtKzl5NBjMs05BJmVlxaQJVfSWpG/yiegFbPp5BnK+
         mba2QAmSoXK1sb2caQLWSCI1Wq58DICOB96sy+K3yXG3hQOYLRC3W5FxIxmHCs5EmymG
         ME4EEqGZ6IcsME4hv1FtsetcBdNk29sIdrxN2Yiu17sT+njKwfgr1X3XDL74Mxz5tOai
         KBRmhZXk0Kh75w9vF5X1E89QE8z2Pfu9LRa8szssxquY4pIlvwvnN8q6JONnpRCVC+Lz
         /JpiSqYgEowQ7itdsyS721rXPfLQOfLtC60k1LtBp8WsMPT2gEVce+vpjPMW52AEzoZF
         Wpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697857886; x=1698462686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBGgcSahe6pso8Cm0aFvPdVOr6UNqZiyFa2q1//pNtM=;
        b=hOngrJDfZFEs0eEJPxngao1gTN9XXN3OIRGfq4+xG4jNjjRVB/CChsyIIW5wOJfVHj
         dHERV84IPEhTPZOZszsUGPlNfbfX/MlWUI29RKD4fK2/fso5OeLP+697gsGYQLwzuoqR
         3LHrruuSwRjgY4WHoEELfan6h83Z743GIDYXPde4ZUeWsixgFuCJzv5sDXRbwNKxs3WW
         /M/d68dgFHvpAq74/AQojsxyY3F20FLtm6sbPL+9Y07q0ifJM5XYlPhn/BJlscDsPh5t
         o70NK4BCn1Bw+UricYTdEsfSndW0+vZKFOIL5LRZ8cBOKkfslNn61LfO86uNS0R1Erle
         cepw==
X-Gm-Message-State: AOJu0YxAm+ELc8wJ98TvNNExKZzfTixgMwXyjfGhPvX3dWs5n19IfhUz
	1mj2VuznnMiqlNv96nqRkB+3YPuzVExvnU4S7sY=
X-Google-Smtp-Source: AGHT+IFbiz/sHceugWijstpTaRwa2za1kwWfRmqb27n1ztNdQwYWN7Wr9QFNaxjX8aeSbc5T1jKrVc+uEo2UwJJLPRw=
X-Received: by 2002:a17:90b:30f:b0:27d:19eb:13bd with SMTP id
 ay15-20020a17090b030f00b0027d19eb13bdmr3071826pjb.49.1697857886516; Fri, 20
 Oct 2023 20:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231020070632.1188561-435-nic_swsd@realtek.com> <976a63ba-34ab-4554-9937-5c0440752fa0@amd.com>
In-Reply-To: <976a63ba-34ab-4554-9937-5c0440752fa0@amd.com>
From: Forest Crossman <cyrozap@gmail.com>
Date: Fri, 20 Oct 2023 22:11:15 -0500
Message-ID: <CAO3ALPwwV8D9+2Cq80V2eBDto-odFUHShfxZZFzYpmRA2O4ETA@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] rtl_nic: update firmware of RTL8156B
To: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Hayes Wang <hayeswang@realtek.com>, linux-firmware@kernel.org, fejes@inf.elte.hu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 2:07=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 10/20/2023 02:06, Hayes Wang wrote:
> > rtl8156b-2.fw
> >     version: rtl8156b-2 v3 10/20/23
> >
> > Signed-off-by: Hayes Wang <hayeswang@realtek.com>
> > ---
>
> Your patch failed to apply.  Please try again.  Binary patches and email
> can sometimes be problematic.

FWIW, this worked for me:

$ curl -o firmware.patch
https://lore.kernel.org/all/20231020070632.1188561-435-nic_swsd@realtek.com=
/raw
$ git am firmware.patch

Comparing that patch with the one b4 generates, it seems b4 is
removing the newline between the last line of the original patch (the
one ending with "r;") and the two dashes ("--") before the git
version. Adding that missing newline causes `git am
20231020_hayeswang_rtl_nic_update_firmware_of_rtl8156b.mbx` to
succeed. Perhaps this is a bug in b4?

Regards,
Forest
