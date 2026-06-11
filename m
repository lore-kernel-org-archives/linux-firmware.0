Return-Path: <SRS0=pR3H=EH=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30750CD98C7
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jun 2026 08:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 198861F00899; Thu, 11 Jun 2026 08:17:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781165834;
	b=R0lafHT6w6dYgeJtN8M/icKWnnNXuwbKyOIll95jHtskTTat+DlifowpWjKdXd4YvolB
	 lgQJGsKY+h3TDRJYExuATHJO8uJR982NNNCwnxzQQy5uicxLtF6V+ThgKVklB9ZHAPazn
	 w48SFdE7K9Vj2mflbwGHhQIh4CSjwLeXoprL9oBAX8cRi+xVd90pDnbBTgi8cdputQD3T
	 d7VLGdZtNgBj2znCrkQYgYbUaQPPpgebk9MhTxr6cgCKUhBr4tSLzLH/MLiScOgOJDAS+
	 ym22jvZSNPxUo5sbtayYsiz97CAMhbEvPQJ5pWI6HlNURsbRz+O7C1Y+MF/WirCVdMQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781165834;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:List-Id:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pgP2nnwfX/ZWDPvjuJJwj3WPW4osedxybftmJ3SmUqQ=;
	b=cmvxVnbbdJM9wxwettDVGCuypqwqgR/DEW70MLOnuNpvKyBfB640rD9Ugm/lmleJNBnB
	 CTpg6VO/ePSr8ml1Qd2JFqX+daOMVQ+S7gNea88KHtIU+RqruyHfi+ZLbHkdWxbtMdrHw
	 fUkfPzeqN+c4ODaJ6gr0lF7Myjilf9n8LDyX7wxXnMTgrZe38Uu+YqNmcE6fXG6lya6hi
	 CMW/PkVv0ZNYq5RHmLlT/L65MqYFfqKuBgt+cehr1sDe3+uXlPyIP1k2qYbzvDfHfpmoy
	 aq7ZUHpiCNw2Ok2cBtz1bAuW5moiObFxVrM6Km+tMeKWqt7Ok+e8g3av+nrUnu5xEQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="oz3/8vOq";
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECB491F00893;
	Thu, 11 Jun 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oz3/8vOq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org ECB491F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65B8GuW521777987, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781165816; bh=pgP2nnwfX/ZWDPvjuJJwj3WPW4osedxybftmJ3SmUqQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=oz3/8vOqaJOBXYaIZwzJWoC+CWuviqd4vfeVDjwmyHszn1Gd7RdqmOeQkPtY2wWgU
	 VJK7dphLaD52X4oW0NSccG7JvdG8F99WQxaE66treLPxUkMk3NH9h8pRMeZs7nZ+jE
	 GnXGohVZNLug7MWVvfsKtabTydcHN0MRP7z8OR2pULf73KWjJuJG27M3dlQ3yJd1WR
	 PHYrD4j9nHRPIHfErll4rTwa3rqGGYcDkq5K//roryyyF2/xJcuHNWUn4gT0QkMH7v
	 9+CeMuU7IeZewRZIcvkyT2PInUrouyJr3X8/hdM4s8KnT1maGixMps1AWNIq3PKEWB
	 xhftfSVN1+V8w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65B8GuW521777987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2026 16:16:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Jun 2026 16:16:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Jun 2026 16:16:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 11 Jun 2026 16:16:55 +0800
From: Hau <hau@realtek.com>
To: Johan Alvarado <contact@c127.dev>, Switchfae <Switchfae@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>, "alsi@bang-olufsen.dk"
	<alsi@bang-olufsen.dk>, "dmitry.baryshkov@oss.qualcomm.com"
	<dmitry.baryshkov@oss.qualcomm.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
Subject: RE: RTL8367S DW8051 SerDes firmware: license clarification for
 linux-firmware inclusion
Thread-Topic: RTL8367S DW8051 SerDes firmware: license clarification for
 linux-firmware inclusion
Thread-Index: AQHc+PxCKB91F16lEkKnJqssE19q77Y5Avsg
Date: Thu, 11 Jun 2026 08:16:55 +0000
Message-ID: <b1a0625c970a4e98bfd3fdb27d7dfe5c@realtek.com>
References: <0100019eb284f2f3-52c3f99b-b3bf-41a1-87aa-50966385d0b3-000000@email.amazonses.com>
In-Reply-To: <0100019eb284f2f3-52c3f99b-b3bf-41a1-87aa-50966385d0b3-000000@email.amazonses.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

KyBTd2l0Y2ggVGVhbSBGQUUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKb2hhbiBBbHZhcmFkbyA8Y29udGFjdEBjMTI3LmRldj4NCj4gU2VudDogVGh1cnNkYXksIEp1
bmUgMTEsIDIwMjYgMToxMiBBTQ0KPiBUbzogbmljX3N3c2QgPG5pY19zd3NkQHJlYWx0ZWsuY29t
Pg0KPiBDYzogbGludXN3QGtlcm5lbC5vcmc7IGFsc2lAYmFuZy1vbHVmc2VuLmRrOw0KPiBkbWl0
cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb207IGxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmcN
Cj4gU3ViamVjdDogUlRMODM2N1MgRFc4MDUxIFNlckRlcyBmaXJtd2FyZTogbGljZW5zZSBjbGFy
aWZpY2F0aW9uIGZvcg0KPiBsaW51eC1maXJtd2FyZSBpbmNsdXNpb24NCj4gDQo+IA0KPiBFeHRl
cm5hbCBtYWlsIDogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSB0aGUgb3JnYW5p
emF0aW9uLiBEbyBub3QNCj4gcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQg
aXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gSGVsbG8sDQo+IA0KPiBJIGFtIHRoZSBhdXRob3Igb2Yg
YSBwYXRjaCBzZXJpZXMgY3VycmVudGx5IHVuZGVyIHJldmlldyBvbiBuZXRkZXYsIGFkZGluZw0K
PiBTR01JSS9IU0dNSUkgc3VwcG9ydCBmb3IgdGhlIFJUTDgzNjdTIHN3aXRjaCB0byB0aGUgbWFp
bmxpbmUgTGludXgNCj4gcnRsODM2NW1iIERTQSBkcml2ZXI6DQo+IA0KPiANCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzAxMDAwMTllYjBiMTgyMmUtZmZjNTYyNmMtMWI5Zi00Yzhh
LThhMQ0KPiBhLTc1OWE5ZTY2NWY0Zi0wMDAwMDBAZW1haWwuYW1hem9uc2VzLmNvbS8NCj4gDQo+
IEJyaW5naW5nIHVwIHRoZSBTZXJEZXMgb24gdGhpcyBjaGlwIHJlcXVpcmVzIGxvYWRpbmcgYSBz
bWFsbCBmaXJtd2FyZSBibG9iDQo+ICgxMjMzIGJ5dGVzKSBpbnRvIHRoZSBlbWJlZGRlZCBEVzgw
NTEgbWljcm9jb250cm9sbGVyLiBUaGUgZHJpdmVyIHJlcXVlc3RzDQo+IGl0IHZpYSB0aGUga2Vy
bmVsIGZpcm13YXJlIEFQSSBhcyByZWFsdGVrL3J0bDgzNjdzLXNnbWlpLmJpbi4NCj4gDQo+IFRo
ZSBvbmx5IHB1YmxpYyBzb3VyY2Ugb2YgdGhpcyBibG9iIGlzIHRoZSBydGw4MzY3YyB2ZW5kb3Ig
U0RLIGFzIGRpc3RyaWJ1dGVkIGluDQo+IEdQTCBzb3VyY2UgY29kZSByZWxlYXNlcyBieSBSZWFs
dGVrJ3MgY3VzdG9tZXJzIChpbiBteSBjYXNlIHRoZSBNZXJjdXN5cw0KPiBNUjgwWCB2MiBHUEwg
Y29kZSBkcm9wKSwgd2hlcmUgaXQgaXMgZW1iZWRkZWQgYXMgYSBieXRlIGFycmF5IChTZ21paV9J
bml0W10NCj4gaW4gcnRsODM2N2NfYXNpY2Rydl9wb3J0LmMpLg0KPiANCj4gSSBzdWJtaXR0ZWQg
dGhlIGJsb2IgdG8gbGludXgtZmlybXdhcmU6DQo+IA0KPiANCj4gaHR0cHM6Ly9naXRsYWIuY29t
L2tlcm5lbC1maXJtd2FyZS9saW51eC1maXJtd2FyZS8tL21lcmdlX3JlcXVlc3RzLzEwOTINCj4g
DQo+IGJ1dCBpdCBjYW5ub3QgYmUgYWNjZXB0ZWQgaW4gaXRzIGN1cnJlbnQgc3RhdGU6IHRoZSBz
dXJyb3VuZGluZyBTREsgY29kZSBpcw0KPiBHUEwtbGljZW5zZWQsIHlldCB0aGUgYWN0dWFsIHNv
dXJjZSBjb2RlIG9mIHRoZSA4MDUxIG1pY3JvY29kZSBoYXMgbmV2ZXINCj4gYmVlbiBwdWJsaXNo
ZWQsIHNvIHRoZSBlZmZlY3RpdmUgbGljZW5zZSBvZiB0aGUgYmxvYiBpcyB1bmNsZWFyIGFuZCBH
UEwNCj4gY29tcGxpYW5jZSBjYW5ub3QgYmUgbWV0IGJ5IHJlZGlzdHJpYnV0aW5nIGl0IChzZWUg
cmV2aWV3IGJ5IERtaXRyeSBCYXJ5c2hrb3YNCj4gaW4gdGhlIE1SIGFib3ZlKS4NCj4gDQo+IE1h
eSBJIGFzayBSZWFsdGVrIGZvciBvbmUgb2YgdGhlIGZvbGxvd2luZzoNCj4gDQo+ICAgMS4gU3Vi
bWl0IHRoZSBmaXJtd2FyZSB0byBsaW51eC1maXJtd2FyZSBkaXJlY3RseSwgd2l0aCBhbg0KPiAg
ICAgIGFwcHJvcHJpYXRlIHJlZGlzdHJpYnV0aW9uIGxpY2Vuc2UsIGFzIHRoZSBSZWFsdGVrIE5J
QyB0ZWFtDQo+ICAgICAgYWxyZWFkeSBkb2VzIGZvciB0aGUgcnRsX25pYyBmaXJtd2FyZSBmaWxl
czsgb3INCj4gDQo+ICAgMi4gUHJvdmlkZSBhbiBleHBsaWNpdCBsaWNlbnNlIHN0YXRlbWVudCBw
ZXJtaXR0aW5nIHJlZGlzdHJpYnV0aW9uDQo+ICAgICAgb2YgdGhpcyBmaXJtd2FyZSB2aWEgbGlu
dXgtZmlybXdhcmUsIGFuZCBBQ0sgdGhlIG1lcmdlIHJlcXVlc3QNCj4gICAgICBhYm92ZS4NCj4g
DQo+IElmIHRoaXMgbWFpbGJveCBpcyBub3QgdGhlIHJpZ2h0IGNvbnRhY3QgZm9yIHRoZSBzd2l0
Y2ggcHJvZHVjdCBsaW5lLCBJIHdvdWxkIGJlDQo+IHZlcnkgZ3JhdGVmdWwgaWYgeW91IGNvdWxk
IGZvcndhcmQgdGhpcyByZXF1ZXN0IHRvIHRoZSB0ZWFtIHJlc3BvbnNpYmxlIGZvciB0aGUNCj4g
UlRMODM2N1MgLyBydGw4MzY3YyBTREssIG9yIHBvaW50IG1lIHRvIHRoZSByaWdodCBjb250YWN0
Lg0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIHRpbWUuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEpvaGFuIEFsdmFyYWRvIDxjb250YWN0QGMxMjcuZGV2Pg0K
