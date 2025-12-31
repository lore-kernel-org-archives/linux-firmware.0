Return-Path: <SRS0=icLc=7F=qq.com=793222067@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B9DEE49BD
	for <linux-firmware@archiver.kernel.org>; Wed, 31 Dec 2025 03:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C151BC16AAE; Wed, 31 Dec 2025 03:43:27 +0000 (UTC)
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D381EC116B1
	for <linux-firmware@kernel.org>; Wed, 31 Dec 2025 03:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D381EC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1767152603; bh=KJieOtlcnYVBcOo1I0ACpaX0RfjJd6mgutN2gEzFo7A=;
	h=From:Subject:Date:To;
	b=l3a/fYlieQNNiUQwO34s8eHNFcFsUiNpMZSJ3kG3ntlO2Pwl9mPgmGGbCmHd3gFH0
	 e8EGsxI4qeDMLQxFP+V/rV7IieBUZO6Gx5pu++yXQsmznFi87CDRPCyox4k0aghrCl
	 Sj7n5oiM7I4XvYdEeNCBL/YPrG9I2BoUir80JsOY=
X-QQ-XMRINFO: N+gupeqCsbX2VDY1MJ80Zvm2Nd9q8sTYww==
X-QQ-XMAILINFO: MYc2YkBNs+pU7LFI4y5hTCJg8f7PDZzVwU0SK1eX7KJQiSvmzsUUWr1pWVqjnQ
	 jHv/wDsRX29UoLSEvu8m55ZLXKSTrXuONDIJOV6aHjM+YouMm1QVRYtBdFREhVX9mqPP40p6ZbX4n
	 w6gkIFeWitHJz99n9MuA14I3N8p6YeOSMOcjYlOKyos7VsU/uxsDHFAWIeNLQQSPSlKTQoTKjWDN8
	 Cte/zu+ztHr/U125vuAhfh3/xPRXLnSVD6KEknqBXj/UI8wfyPHT10Xa2MXJLk2jvDF7bjUHHAcwQ
	 WEijNJnhZxC9OeM929TOmDtlpD0SvD9Ifav+IFau1WBlsnWrENV+qsmpeazdmBCNGr3ARuz/Gm8a8
	 fMZSvELAMks66ZWdkQuzZmUU4QiOI0v0EqRXDZsO0FB35FhBSAfPxfuyD05fmHPzyzHR38W9CFQC3
	 63HL/7IyJkPyx/zee5r+2vi4pcLNdJhsn/DkrZiMuIEODWLyzmHAHDrRNHu4lPBIsCx/dhXO6doGL
	 2RjVqcJfbHTsG7HhLD1ejfK5KklfMXv8JyJRG9A3odrQq4zjbiy0LX7m2rdWpHbCAdr45UJKpD2rJ
	 c3PkySUJvcj9Lw7NfNGSlMbtyJTQAaStR+Os1D5RlvidBcxRjQEcpWjjvLCoO9sejQdicHBAV5kfi
	 z1JcB6yx5NGllT8MwFCo2sF29UxMcrA+tfGLDMU/6uBrN5mio8YiCgkxJhu7g/MNFCSOZgqOmP6Fj
	 bOIwEyqTuHJUSd24BQfE6knaEq1njWT+6LBwL01/PFGLb00iQH6MpVgWvOVIXdifaNPd0SL4QE4NH
	 YxylGMrp/tl8RW0vNULjkwxPHwwvBeVj+bHMmp4GDzi4NGTRd7YCKzhHXzeiV6iET3+66aPlag5ON
	 jptgFpADoXM6WsfpRduDg8iyu03Hk01O8A3YcuWFZcAHO04HxU+rqyC2ajZoQuOkpawYSBX3324JB
	 2k8igCvcqh5Ab7Mqc04haBAbEl7ZTuLGB8Ogo6zuz5fQA67Oqw848oZmNbGyGPOsDZkL205TYLUTF
	 QDkIQ3hfMMJsXng+6BTTl3nTPKmtGqC37h0W0fY3edanhgszUIVsaMRFLzJwkrCAAp5GS5dxukKqG
	 v0RpQft4bONgtgVaZvwIiDWnlVf7T9+H9yYSK1JNEz0JP8Y77LJ/woUv
X-QQ-FEAT: Xqh9UYnCrXCv5KoXBZbrZ3kQDq3cZ4HH
X-QQ-SSF: 0000000000000080000000000000
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 114.97.167.165
X-QQ-STYLE: 
X-QQ-mid: webmail651t1767152524t9114937
From: "=?ISO-8859-1?B?SmVzc2ll?=" <793222067@qq.com>
Subject: gas hose
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_69549B8C_12D2F600_0346B6B0"
Content-Transfer-Encoding: 8Bit
Date: Wed, 31 Dec 2025 11:42:00 +0800
X-Priority: 3
Message-ID: <tencent_1F7597E5C186D42FBC6564EF14BDF931EB0A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org

This is a multi-part message in MIME format.

------=_NextPart_69549B8C_12D2F600_0346B6B0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgTWFuYWdlciwNCg0KDQoNCg0KVGhpcyBpcyBKZXNzaWUgZnJvbSBDaGluYS4gT3VyIGNv
bXBhbnkgc3BlY2lhbGl6ZXMgaW4gbWFudWZhY3R1cmluZyBpbmR1c3RyaWFsIGhvc2VzIGlu
IENoaW5hLg0KDQpNYWluIFByb2R1Y3RzOg0KDQpTaW5nbGUtbGluZSBveHlnZW4vYWNldHls
ZW5lIHJ1YmJlciBob3NlLCBQcm9wYW5lIGdhcyBob3NlLCBUd2luIG94eWdlbi9hY2V0eWxl
bmUgcnViYmVyIGhvc2UsIEFyZ29uIGhvc2UuDQoNCkFpci9XYXRlciBydWJiZXIgaG9zZSwg
U3RlYW0gaG9zZSwgT2lsIHJ1YmJlciBob3NlLCBUUEUgZnVlbCBob3NlLg0KDQpQVkMgaG9z
ZS4NCg0KU3RhaW5sZXNzIHN0ZWVsIGhvc2UuDQoNClRJRyBndW4gcHJvdGVjdGl2ZSBjb3Zl
ci4NCg0KRG8geW91IGhhdmUgYW55IHJlcXVpcmVtZW50cyBmb3IgdGhlc2UgaG9zZXM/IElm
IHNvLCB3aGljaCB0eXBlIGRvIHlvdSBuZWVkPyBJIGNhbiBwcm92aWRlIHlvdSB3aXRoIGEg
cXVvdGF0aW9uIGZvciBjb21wYXJpc29uLg0KDQpMb29raW5nIGZvcndhcmQgdG8geW91ciBy
ZXBseS4NCg0KQmVzdCByZWdhcmRzLA0KDQpKZXNzaWUu

------=_NextPart_69549B8C_12D2F600_0346B6B0
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PHAgc3R5bGU9IiBtYXJnaW46IDBweDsgOyA7IDsgOyA7IDsgOyA7
IDsgOyAiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7Ij5IaSBNYW5hZ2VyLDwv
c3Bhbj48L3A+PHAgc3R5bGU9IiBtYXJnaW46IDBweDsgOyA7IDsgOyA7IDsgOyA7IDsgOyAi
Pjxicj48L3A+PHAgc3R5bGU9IiBtYXJnaW46IDBweDsgOyA7IDsgOyA7IDsgOyA7IDsgOyAi
PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7Ij5UaGlzIGlzIEplc3NpZSBmcm9t
IENoaW5hLiBPdXIgY29tcGFueSBzcGVjaWFsaXplcyBpbiBtYW51ZmFjdHVyaW5nIGluZHVz
dHJpYWwgaG9zZXMgaW4gQ2hpbmEuPC9zcGFuPjwvcD48cCBzdHlsZT0iIG1hcmdpbjogMHB4
OyA7IDsgOyA7IDsgOyA7IDsgOyA7ICI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlh
bDsiPk1haW4gUHJvZHVjdHM6PC9zcGFuPjwvcD48b2wgc3RhcnQ9IjEiIHN0eWxlPSIiPjxs
aSBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsOyI+U2luZ2xlLWxpbmUgb3h5Z2VuL2FjZXR5
bGVuZSBydWJiZXIgaG9zZSwgUHJvcGFuZSBnYXMgaG9zZSwgVHdpbiBveHlnZW4vYWNldHls
ZW5lIHJ1YmJlciBob3NlLCBBcmdvbiBob3NlLjwvbGk+PGxpIHN0eWxlPSJmb250LWZhbWls
eTogQXJpYWw7Ij5BaXIvV2F0ZXIgcnViYmVyIGhvc2UsIFN0ZWFtIGhvc2UsIE9pbCBydWJi
ZXIgaG9zZSwgVFBFIGZ1ZWwgaG9zZS48L2xpPjxsaSBzdHlsZT0iZm9udC1mYW1pbHk6IEFy
aWFsOyI+UFZDIGhvc2UuPC9saT48bGkgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbDsiPlN0
YWlubGVzcyBzdGVlbCBob3NlLjwvbGk+PGxpIHN0eWxlPSJmb250LWZhbWlseTogQXJpYWw7
Ij5USUcgZ3VuIHByb3RlY3RpdmUgY292ZXIuPC9saT48L29sPjxwIHN0eWxlPSIgbWFyZ2lu
OiAwcHg7IDsgOyA7IDsgOyA7IDsgOyA7IDsgIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6
IEFyaWFsOyI+RG8geW91IGhhdmUgYW55IHJlcXVpcmVtZW50cyBmb3IgdGhlc2UgaG9zZXM/
IElmIHNvLCB3aGljaCB0eXBlIGRvIHlvdSBuZWVkPyBJIGNhbiBwcm92aWRlIHlvdSB3aXRo
IGEgcXVvdGF0aW9uIGZvciBjb21wYXJpc29uLjwvc3Bhbj48L3A+PHAgc3R5bGU9IiBtYXJn
aW46IDBweDsgOyA7IDsgOyA7IDsgOyA7IDsgOyAiPjxzcGFuIHN0eWxlPSJmb250LWZhbWls
eTogQXJpYWw7Ij5Mb29raW5nIGZvcndhcmQgdG8geW91ciByZXBseS48L3NwYW4+PC9wPjxw
IHN0eWxlPSIgbWFyZ2luOiAwcHg7IDsgOyA7IDsgOyA7IDsgOyA7IDsgIj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6IEFyaWFsOyI+QmVzdCByZWdhcmRzLDwvc3Bhbj48L3A+PHAgc3R5
bGU9IiBtYXJnaW46IDBweDsgOyA7IDsgOyA7IDsgOyA7IDsgOyAiPjxzcGFuIHN0eWxlPSJm
b250LWZhbWlseTogQXJpYWw7Ij5KZXNzaWUuPC9zcGFuPjwvcD4=

------=_NextPart_69549B8C_12D2F600_0346B6B0--

