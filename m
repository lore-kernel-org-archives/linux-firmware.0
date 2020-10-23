Return-Path: <SRS0=LoId=D6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC51C4363A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2020 12:07:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C20B208E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2020 12:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2/u/98U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2YdYa8Gn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C20B208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K/cjEtlagfY+Bh+lDCSgpRzN5g/AQQcPrU2swjsyIMk=; b=f2/u/98UbMKu8X/wXOXtT43+P
	/wNYADZdiox2QI+Pce6LMVoiXdakAIwNLHzV0Fnocz+9K7it2hKWe37WZrfw6N6j/FFYIKzl7yMsC
	6hlPR3Nat11aAzhm7UNVm5LyDrjmXHVvesbxgAhmsotRN32qdHBpNnimeUiqOsslReGPOVz+QvJqg
	njZ2Zmog8xn/Dak0W6+4BDr4pZKsdARS11aPHW3SA84/UOB3CinIyCzfPuLrt0HGpaGOQ/SDM21eG
	80FJrWA2t+ARIfxa/zo24mgGACkjc1shYru4KoUij9rLOCHgIHWjEx7FcIrpd3OrJupjBWnkjbY33
	XxWUdPkbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVvpc-0006B7-OF; Fri, 23 Oct 2020 12:06:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVvpa-0006AT-OZ
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Oct 2020 12:06:03 +0000
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0C5E208E4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Oct 2020 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603454762;
 bh=HM2EfumIMPvy7zLqBOFENGsu/uaB8YcE55+EvPiw+gk=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=2YdYa8GnIjZwuq66lhgUfVuVgcMLOlVhaSsC4O1DFsDAYHcCrWN/N1oKdBPy2e1oU
 YmLFYgAk4WmNlv2jdN72NYP8Ap2CxB1TP46YqcW89XVObfoolHGZqo2jpsf9rutpK7
 Mq6O9KnQRkyfBBGJCzdpCE+TJeHXKIr3/unYCzw0=
Received: by mail-io1-f53.google.com with SMTP id u62so1447564iod.8
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Oct 2020 05:06:01 -0700 (PDT)
X-Gm-Message-State: AOAM531VGdmenZusFQRhRoTBQaFA5rl2JJyDano/7TxDg0i7VwGMpiWX
 srWJlN2QOfOmWORAk3XXGTJ3lgQnsJ8QJ7iEWjc=
X-Google-Smtp-Source: ABdhPJzn+egfTDXMlr27EinypWoWWPWlBnjMbBBocaonk7iwpQ3Y7AnNn8F8xoRfuDOhg6PUE8vuGlbLEKobCncET5g=
X-Received: by 2002:a05:6638:2512:: with SMTP id
 v18mr1667480jat.106.1603454760266; 
 Fri, 23 Oct 2020 05:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org>
 <dfbf51326d00ae72ed2b6149e7ccf570@codeaurora.org>
In-Reply-To: <dfbf51326d00ae72ed2b6149e7ccf570@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 08:05:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6aDspcdPFoLR_BbQcPzMpsfo3O6KWiRf+tTuAq11skMQ@mail.gmail.com>
Message-ID: <CA+5PVA6aDspcdPFoLR_BbQcPzMpsfo3O6KWiRf+tTuAq11skMQ@mail.gmail.com>
Subject: Re: Update venus firmware files for v5.4
To: asitshah@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_080602_881674_57A5490F 
X-CRM114-Status: GOOD (  20.84  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: dikshita@codeaurora.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Linux Firmware <linux-firmware@kernel.org>, linux-media-owner@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, vgarodia@codeaurora.org,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201023120549.x5sYc9FXr5gjHbJ5Z0hmnedlirA_ANxYGNlyAIB6_pQ@z>

Pulled and pushed out.

josh

On Tue, Oct 20, 2020 at 1:47 AM <asitshah@codeaurora.org> wrote:
>
> Hi Team,
>
> Gentle Reminder. Please let me know if anything is missing.
>
> Regards,
> Asit
>
>
> On 2020-10-08 15:20, asitshah@codeaurora.org wrote:
> > Hi Team,
> >
> > Please include updated Venus Firmware bins for v5.4.
> >
> > Snapshot of pull request is as below, let me know if anything is
> > missing.
> >
> >>>>>>>
> >
> > The following changes since commit
> > 00a84c516078defb76fbd57543b8d5c674a9a2be:
> >
> >   linux-firmware: Update AMD SEV firmware (2020-09-16 08:01:44 -0400)
> >
> > are available in the git repository at:
> >
> >   https://github.com/shahasit/video-linux-firmware/tree/master
> >
> > for you to fetch changes up to
> > a09b728b77f5e3b335ff85c6c729248e0121f02c:
> >
> >   qcom : updated venus firmware files for v5.4 (2020-10-08 15:07:59
> > +0530)
> >
> > ----------------------------------------------------------------
> > Asit Shah (1):
> >       qcom : updated venus firmware files for v5.4
> >
> >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> >  qcom/venus-5.4/venus.b02 | Bin 870812 -> 873100 bytes
> >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
> >  qcom/venus-5.4/venus.mbn | Bin 916924 -> 919212 bytes
> >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> >  6 files changed, 0 insertions(+), 0 deletions(-)
> >
> > Regards,
> > Asit

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
