Return-Path: <SRS0=LCWc=FX=gmail.com=ydewid@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52954C4361B
	for <linux-firmware@archiver.kernel.org>; Sat, 19 Dec 2020 08:50:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1375523BE2; Sat, 19 Dec 2020 08:50:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE7CB23BCC
	for <linux-firmware@kernel.org>; Sat, 19 Dec 2020 08:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE7CB23BCC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ydewid@gmail.com
Received: by mail-wr1-f44.google.com with SMTP id m5so5487617wrx.9
        for <linux-firmware@kernel.org>; Sat, 19 Dec 2020 00:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=C0SwDgzRYOiFS0/AlDUedxqy1ofiTRcL8MxzQ4z40bY=;
        b=hpaOVSnzsDHIKFY8GsTKw+8t8rHGUWLSV8i7SK+xGTDbNUvinCPohfwY0I1HuuI9tm
         QxIpdpp7ObCgA+yNptT++PCyJL8DnkgjDG7rNdxZRLdle+zaYzOTeb2lI7d4odrCH3aY
         SFCtOF682rT6KhRdWls79ndxhjE8nwygqdVl77DbgGZsMfAdssi0bqFSxZwaeRxKZ32f
         UfNIwfqmqb7O8MDh7T0yLbdPBq6w8Sj3n5h/vfjuxoIHKyoBYoOF3/HNp6rInAFrLKJp
         vZc12eOgFTLqU72XGCIssY6IBMpH/5Jrb+9QwlJJpx4M5iWmc/opt8VFtXy0zpYuiloN
         iYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=C0SwDgzRYOiFS0/AlDUedxqy1ofiTRcL8MxzQ4z40bY=;
        b=gycV9O74upsoS3xZiwZYwHmP57ghsFFq9xuMj/x+T6q2yabbaA3oGpcIsfLje5cM9U
         aVkkuh6rTZY0TBrstIAr4Xefryt4upNVfJvBdQFqf0Jt05KNGnQvoKXVmdTJhdri/1FA
         QesXetcuwlLq2GcuGe7PfuGsEszpCal3567SW3zcLhfIwMhVwzhU6lqi7lyX26Dv9Y5I
         X/lXJyKkCp5PZS0FS7Uy5ujlO4wVEyJ9FWjC+uEl8LgW53ZjkBqAC7+Jcw1dMQNewq6b
         anXbWt/4NfXnrZka1iwLrONl90vfKVxgieGv2vSkNefXFAbErOGFO6s7MwP0kRrlkxT7
         /5Ng==
X-Gm-Message-State: AOAM531LlCq5YJLj89n3nCLPOYASMq76xkWpX9/jNp5CJNhjqijNYtcl
	497BGSLpPkdU89gNE5S0B1URI/5/1aNyfM2RT3w0cIAg5xA=
X-Google-Smtp-Source: ABdhPJzEDRDgYhV52AB3D1a65CvIrzxEx9QI2XQcSCyotleNmPC18jsAcJRSVdb4dkqFoADfszuKtBZd16SSz/Vv8pU=
X-Received: by 2002:a5d:4fcf:: with SMTP id h15mr8206469wrw.323.1608367856236;
 Sat, 19 Dec 2020 00:50:56 -0800 (PST)
MIME-Version: 1.0
From: Yorick de Wid <ydewid@gmail.com>
Date: Sat, 19 Dec 2020 09:50:45 +0100
Message-ID: <CAGDk_A-uNtewPCAf3mDOAvjvXY005RCMb2cdBmqtS4ysE392Zg@mail.gmail.com>
Subject: Suspecting firmware issue on RTL 8152/8153
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

We've been tracking a bug via Bugzilla which is assigned to the
virtual alias drivers_network@kernel-bugs.osdl.org.
It looks like there is no maintainer assigned to the issue.

From what I can tell it points into the direction of a RTL firmware bug.

Konstantin Ryabitsev advised to inform this mailing list as well.

https://bugzilla.kernel.org/show_bug.cgi?id=198931

Yorick de Wid
