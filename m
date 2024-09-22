Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D9BCF9C7C
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29C71C4CED6; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 144EEC4CED5;
	Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036274;
	bh=3nmMy4qGsFq3zJjieOYU/XI2oZHO/ZXIMcLhaQjgWr8=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=ZGYiBa1ztKRmstZY2HvAXj6by9eO2cV0vhnc2+n/6g67p16b37p2wVmm9o1NlRL5m
	 RR7Z/Ag+r/03zpfQHkRrBPOIsVlbfxM+4rs2sIvvS9KaixkttbXcLcPYUL6lYeDQmq
	 ssy1/bFUKErYllxUNe6Yl2jN+kljBvAJ2ro7pYLkrjDNLTIg/gX/r9PbjSCUpXO15T
	 z7LvWq1Z6sLtAoQ+EzccYGgy2XnUAqpfmJdzBorZ0LykOfqOXbiPfnWSibQmb6Tesy
	 FKdA2SBACDWwxYTMs/Ry1gv9h+aHAn1LqBBBsre35lufdboKnEjXaBPr06jI58bAxu
	 YnjTMB1BMpYFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C88CCF9C72;
	Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:51 +0100
Subject: [PATCH 16/16] Dockerfile: remove unused packages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-16-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=979;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=I4A7Q/zx2Dbr4Eib6uzBu+Qu7hxIyPhjHprN78ziA+4=;
 b=GW/8srlW3/pycxnP2Oc0OX3vZdMN4TRB9/N3aoisHDXELQzAA5LBUNrv4QwV3lyuEewQ5Iaft
 ABk6ZS587dSBemF/DrjvNxLfliYWxMdRBfmzSsJZgXNXAe8XS9CMJBZ
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

We're not compiling anything so gcc, the various *dev package and npm are not
needed.

Aside: we should probably document what this file is, how to use and most
importantly make sure the registry gets updated as we push new one.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 Dockerfile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Dockerfile b/Dockerfile
index 9350dc71fc1d2473771a6b0a6a40f9a6e7434ddf..ea86f6cadcd3cc0ab415eda6fa238d8e1f18daf4 100644
--- a/Dockerfile
+++ b/Dockerfile
@@ -1,10 +1,7 @@
 # Leverage FDO CI fairy, but add pre-commit to it
 FROM quay.io/freedesktop.org/ci-templates:ci-fairy-sha256-eb20531b68e57da06f4e631402fd494869b1529e2c4ad05cfe24ef3fb8038815
-RUN apk add python3-dev
-RUN apk add gcc
-RUN apk add musl-dev
+RUN apk add python3
 RUN apk add git
-RUN apk add npm
 RUN apk add rdfind
 RUN apk add shellcheck
 RUN pip install pre-commit --ignore-installed distlib

-- 
2.46.1


