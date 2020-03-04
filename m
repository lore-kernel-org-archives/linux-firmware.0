Return-Path: <SRS0=e0dL=4V=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B857C3F2CE
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Mar 2020 21:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3A820828
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Mar 2020 21:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3A820828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C262489973;
	Wed,  4 Mar 2020 21:36:06 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABDB89973
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Mar 2020 21:36:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 13:36:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,515,1574150400"; d="scan'208";a="229465370"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga007.jf.intel.com with ESMTP; 04 Mar 2020 13:36:03 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Date: Wed,  4 Mar 2020 13:35:13 -0800
Message-Id: <20200304213513.2239-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Intel-gfx] PR - i915 firmware updates (TGL HuC 7.0.12 and DMC 2.06)
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: jwboyer@kernel.org, intel-gfx@lists.freedesktop.org, kyle@kernel.org,
 ben@decadent.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Message-ID: <20200304213513.1bHgeZP7BPfsCCXqJEF81_-4XGmuRlNUZHZT17IvQPc@z>

SGksCgpLaW5kbHkgYWRkIHRoZSBiZWxvdyBpOTE1IGNoYW5nZXMgdG8gbGludXgtZmlybXdhcmUu
Z2l0CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDAxNDhjZmVmY2JmOTg4OThj
YTY1YmIyNmQ5ZDdkNjM4YjMwZTIxMWQ6CgogIE1lcmdlIGh0dHBzOi8vZ2l0aHViLmNvbS9yamxp
YW8tcWNhL3FjYS1idGZ3ICgyMDIwLTAzLTAyIDA4OjA4OjE1IC0wNTAwKQoKYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Au
b3JnL2RybS9kcm0tZmlybXdhcmUgdGdsX2h1Y183LjAuMTJfZG1jXzIuMDYKCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byBmYjgzNDAyYzc1NzAzNGZkOWFkZWYwODMwNDczOTBiM2IyZjU0
Y2I0OgoKICBpOTE1OiBBZGQgRE1DIGZpcm13YXJlIHYyLjA2IGZvciBUR0wgKDIwMjAtMDMtMDQg
MTM6MTk6MDcgLTA4MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkRhbmllbGUgQ2VyYW9sbyBTcHVyaW8gKDEpOgogICAg
ICBpOTE1OiBhZGQgSHVDIGZpcm13YXJlIHY3LjAuMTIgZm9yIFRHTAoKSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSAoMSk6CiAgICAgIGk5MTU6IEFkZCBETUMgZmlybXdhcmUgdjIuMDYgZm9yIFRHTAoK
IFdIRU5DRSAgICAgICAgICAgICAgICAgICB8ICAgNiArKysrKysKIGk5MTUvdGdsX2RtY192ZXIy
XzA2LmJpbiB8IEJpbiAwIC0+IDE4NjYwIGJ5dGVzCiBpOTE1L3RnbF9odWNfNy4wLjEyLmJpbiAg
fCBCaW4gMCAtPiA1MzAzNjggYnl0ZXMKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgaTkxNS90Z2xfZG1jX3ZlcjJfMDYuYmluCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaTkxNS90Z2xfaHVjXzcuMC4xMi5iaW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
