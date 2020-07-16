Return-Path: <SRS0=FNKs=A3=mediatek.com=ryder.lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MIME_BASE64_TEXT,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7B5C433E0
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jul 2020 01:15:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 799F02076C; Thu, 16 Jul 2020 01:15:33 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
	by mail.kernel.org (Postfix) with ESMTP id 7998C2071B;
	Thu, 16 Jul 2020 01:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AtD0dyy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7998C2071B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ryder.lee@mediatek.com
X-UUID: ae7bca918e20426fa1ac5aea634ece08-20200716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AHUH8qzbFqlocfqW1CvW5nBDI2Z7B9Hx78qi/rQCMPE=;
	b=AtD0dyy7ad6oLkHkMHWeKnCQBAHEm/rfO2/o5MtvcQScz5dCJor19kU30OOUdCj0AcSp038rPlKOTlWxcoE/PmaQwPtI2LEzIxaf68YQGlymfterDODnAPLZrvjTikvInO6P0KrGdrVwA8t/YT7grnycakBSCsBwtWgjWZF4cwA=;
X-UUID: ae7bca918e20426fa1ac5aea634ece08-20200716
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 821451344; Thu, 16 Jul 2020 09:15:28 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 09:15:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jul 2020 09:15:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
	<linux-firmware@kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder Lee
	<ryder.lee@mediatek.com>
Subject: [PATCH] linux-firmware: mediatek: update firmware v2 for MT7615E
Date: Thu, 16 Jul 2020 09:15:25 +0800
Message-ID: <cfee5e2b0064b8aa387e13901913a3a424dc1eec.1594624155.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 
	BC637E75C6416C81581545A12FF0BC8CD561464ECAD424B5361E4BFA766E953C2000:8
X-MTK: N
Content-Transfer-Encoding: base64

RnJvbTogU2hheW5lIENoZW4gPHNoYXluZS5jaGVuQG1lZGlhdGVrLmNvbT4NCg0KVXBkYXRlIHRv
IDIwMjAwNjI5MTExMzM5IHZlcnNpb24gdG8gYWxpZ2ggU0RLLiBNYWlubHkgZml4IERGUyBmYWxz
ZSBhbGFybS4NCg0KU2lnbmVkLW9mZi1ieTogU2hheW5lIENoZW4gPHNoYXluZS5jaGVuQG1lZGlh
dGVrLmNvbT4NClNpZ25lZC1vZmYtYnk6IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNv
bT4NCi0tLQ0KIFdIRU5DRSAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCiBtZWRpYXRlay9tdDc2
MTVfbjkuYmluIHwgQmluIDQ1Nzk5MiAtPiA0NTc5OTIgYnl0ZXMNCiAyIGZpbGVzIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9XSEVOQ0UgYi9X
SEVOQ0UNCmluZGV4IDA4NjM3NGQuLjQwMjU2YmIgMTAwNjQ0DQotLS0gYS9XSEVOQ0UNCisrKyBi
L1dIRU5DRQ0KQEAgLTQ2NDMsNyArNDY0Myw3IEBAIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuDQogRHJpdmVyOiBtdDc2MTVlIC0gTWVk
aWFUZWsgTVQ3NjE1ZSBXaXJlbGVzcyBNQUNzDQogDQogRmlsZTogbWVkaWF0ZWsvbXQ3NjE1X245
LmJpbg0KLVZlcnNpb246IDIwMjAwMTMxDQorVmVyc2lvbjogMjAyMDA2MjkNCiBGaWxlOiBtZWRp
YXRlay9tdDc2MTVfY3I0LmJpbg0KIFZlcnNpb246IDIwMTkwMTE0DQogRmlsZTogbWVkaWF0ZWsv
bXQ3NjE1X3JvbV9wYXRjaC5iaW4NCmRpZmYgLS1naXQgYS9tZWRpYXRlay9tdDc2MTVfbjkuYmlu
IGIvbWVkaWF0ZWsvbXQ3NjE1X245LmJpbg0KaW5kZXggZjZhZDc0ODE1NTY3MmRkNTJmZDdmNDFj
NDUyYzMyMGFkOGVmOGQ3ZC4uNzYxYWQ5YmJjODcxNGVjYTg4MGNiN2ZkMjRhM2MwZWE3NjFiZjgz
OSAxMDA2NDQNCkdJVCBiaW5hcnkgcGF0Y2gNCmRlbHRhIDUxDQp6Y21lRDlDRWY4JHh9ay0hZ3tn
KFBnezZnYzMpezZub011THJoSzdkNSMrSzlYfDYhQm5nTDRgNz58dE80ME9ucDANCkF2SCQ9OA0K
DQpkZWx0YSA1MQ0KeWNtZUQ5Q0VmOCR4fWstIWd7ZyhQZ3s2Z2MzKXs2bm9RQjRSaDg5MypIMndZ
YEhmY1VNbXRvSHkxX2w3LTVmR3BODQoNCi0tIA0KMi4xNy4xDQo=

