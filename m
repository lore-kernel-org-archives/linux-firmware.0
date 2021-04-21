Return-Path: <SRS0=2DKb=JS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51615C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Apr 2021 11:22:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8FD61424
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Apr 2021 11:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8FD61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nuQRHY1BrwrK2l3jZmAz9fcDljZq0wjupZrsho4+OiY=; b=n1bsT+guNY5mAdwuyN3JRWmpu
	hWG/Ulv4UCwvTd0uozMwKc7SvVlzERq3wLFkyk2KH+vXPDAwg0TNY22VJEyRXQwf558a6ueVVthmp
	raex4Vi8Nlvk5bo58kRrEmcqNNMmTyRebVw+h4J7v0Z/cWJl1VAbKcUJyEVixA3/OazHk+DGD07hx
	D6hKHQT6/2WqAfumxkrpUpKZAluHGdjj+/oVyZQMcw986XQTxW5l70cYe5OvWWm5dialMifG0NWj9
	i9VUUTSLVD+oCItolrn4CuR2BCecR1YOkodQ7k5wAEVaQrKaxesZ244cR+4ov8pSWMHHJC9KfRbV6
	fWGeQ/IVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZAu3-00EIUu-UW; Wed, 21 Apr 2021 11:20:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAu1-00EIUa-4j
 for linux-arm-kernel@desiato.infradead.org; Wed, 21 Apr 2021 11:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YBdx2mrs2QSzxdgGLVu8mGegCqeB1OZMJD0jeWgnV9o=; b=ZB98Ts+P1RxXvRrSZOuYB2HNAn
 dRoHyGgKZcbU2KyFdjyIgolqYlU1IYPC0seJY0Sl6XV1h+WcIVjD6blaYExA3Pw3VeQyeI9dCvX9I
 USIZwdb3gK8R5rNcy9fAWtHnpCj0tHgUamNT3zp8XbFo7NX3saDMOQa6oWGiImARBXUU+8I0wzPdb
 ifu9j6dNFxJZEnytorqYsuPIzNzHZ2DiUAJCbjoSDgC7g93lnHlftXqWFDnceOvwhNJQE0bitOzG4
 idVoHGTGyT9Fbmpnbl7AGBOVdmJyLw0Fam1P1NfmEVGlc6U+R4//hCFT9taRgvLLu8d+6Uh4RmxqO
 HFr4Xw3g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAtx-00CpmI-35
 for linux-arm-kernel@lists.infradead.org; Wed, 21 Apr 2021 11:20:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B7E06143C
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 21 Apr 2021 11:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619004012;
 bh=DRMcyeuA5wA5FREh/k/DxdRqF8OdBIsX5HEzCNIqts4=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=N8iN5nAgB7W+lOFD++VCVHz937A6/T7OFxEsw9UuK/e5AW9LNNNHlBiMaWmLyz/oP
 5N9uXX53LiBAfruIc6vQ0sr87CYAMlKGZvvjxalAPKikr9YlRtg0SO7b8LWQy8F28P
 KQNK+hU+uR5dVhTCzzMWLqH658/T9oMG6EmEdtJaH6XTPUJriTCXv5qEEBcCcrrF/0
 rLCfUqZKvg/1cqq8UpwzncMjHHGTwt6pNpGG4Actapjg64HVssLVxglmQ3W2LwNcYa
 eAfdulbHIE20iFWo4mhlwoA2FUd2rrHZM5V3U7Z4bZ0QA8GNnPLQvPJQlh9DTKewUr
 3ptk5oNlDZ8og==
Received: by mail-il1-f170.google.com with SMTP id p15so23701452iln.3
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 21 Apr 2021 04:20:12 -0700 (PDT)
X-Gm-Message-State: AOAM532sHaoeg2k30FjJFNWBzQa+NeNTMsUvshYrut1d03QmzUXmiIhf
 ccrYgZE7KV4HJ3IybO6V9bfeC+tqwUp2/2byCgQ=
X-Google-Smtp-Source: ABdhPJz2yR3srj63bxKy1z41T6I6nZSdTcPhNOSrFF7HLaH5HW8rf7jBzKZrNo14StSUQMtMex4plsYFh1bgrqyDM7E=
X-Received: by 2002:a05:6e02:160d:: with SMTP id
 t13mr26534078ilu.85.1619004011565; 
 Wed, 21 Apr 2021 04:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <f90802a86e80b6d9cc96ea8dd6aef4d8@codeaurora.org>
In-Reply-To: <f90802a86e80b6d9cc96ea8dd6aef4d8@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 21 Apr 2021 07:20:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4wcjrNvBKabAW9BDDLKtZsjHRbyAYG+bqv8sMOu7gr-Q@mail.gmail.com>
Message-ID: <CA+5PVA4wcjrNvBKabAW9BDDLKtZsjHRbyAYG+bqv8sMOu7gr-Q@mail.gmail.com>
Subject: Re: Request to update venus-5.4 FW files
To: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media-owner@vger.kernel.org, 
 vgarodia@codeaurora.org, dikshita@codeaurora.org, pbadge@codeaurora.org, 
 adhudase@codeaurora.org, sampnimm@codeaurora.org, c_mansur@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_042013_196042_615724D7 
X-CRM114-Status: GOOD (  20.58  )
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
Message-ID: <20210421112000.hzUs6Mu2Gv93HnFCk-vjeUibf_U4A5TgAgVoNIEzHcs@z>

On Wed, Apr 21, 2021 at 1:58 AM <smagar@codeaurora.org> wrote:
>
> Hello Team,
>
> Please include updated firmware bins for venus-5.4.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
>
> The following changes since commit
> 85286184d9df1b03bb76049edcfd87c39ce46e94:
>
>    Merge branch 'for-upstream' of
> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
> 11:34:11 -0400)
>
> are available in the git repository at:
>
>    https://github.com/suraj714/linux-firmware-venus.git master
>
> for you to fetch changes up to 5c893c65b862906a627cea238ae8c2d099027dee:
>
>    Updated Venus firmware files for v5.10 (2021-04-20 11:48:28 +0530)
>
> ----------------------------------------------------------------
> smagar (1):
>        Updated Venus firmware files for v5.10
>
>   qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>   qcom/venus-5.4/venus.b02 | Bin 873680 -> 873596 bytes
>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>   qcom/venus-5.4/venus.mbn | Bin 919792 -> 919708 bytes
>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>   6 files changed, 0 insertions(+), 0 deletions(-)

This commit looks reasonable, but it's in the same tree and branch as
the other weird PR I just replied to.  I'm going to wait for a bit on
this one.

josh

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
