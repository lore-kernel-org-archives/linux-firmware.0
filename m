Return-Path: <SRS0=5ycy=6B=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4450BD0E6E1
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Nov 2025 13:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25A0FC4CEF1; Tue, 25 Nov 2025 13:11:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9672C116C6
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 13:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9672C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APA1HB71847634
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 13:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gex0VuVWdS2A7t+fRRBFD5
	J53buVyo0CPv6AtLlKWY4=; b=b+1bsyuotQuiSrVgmTKsgvHjAg83Ll+WFauDtS
	nAQWmB+Gtf/pjhREImOxF+Q/ObXPL0rrjngy/rBXW/cM4QWx2yy7CahrZYgeCaRY
	EnFqar9Zo+mJa7uJdmKas1HbGKU2IOlNWm5lGxZ4+Mjpj+embJAJkLJEoAHroiht
	9eH2POg0GyJGKBFbr1DDWZ8+dDxbNlJeBCPgEP2qGEi6au/HDx3i12/r/VkhMI5x
	dQC2GrBHmj0URyua8qR29nbqyXijU743809yCxyZb/Pn6JlGu2NVnfP9mKLvHRuq
	ZmlIRvsW88ySkYLtGxMtmMKUBVfiKrfoAUXVN/xVWKo5DMYw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qb6pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 13:11:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34361480f51so1328422a91.1
        for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 05:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764076293; x=1764681093; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gex0VuVWdS2A7t+fRRBFD5J53buVyo0CPv6AtLlKWY4=;
        b=VJwmuNC2ZKnFs9F23bNA16JsbPMgylAJjpXhj1g2yGtxAAyaxHSv56EiF2g16KgOAN
         v4C5ZlZOCMhyh4GZUbckIAe/vVRLzAQ8g+S/sIF8nOVBvrS+V0Qy3fFmXbzxgv0B5C4B
         Ytnwzrn3rCKUcpRjxzSZMr5APck+0Bz4lMZRBskrD2OplSiIPQH8B5cFc/7i6112pTWs
         N97UVIZod4EVMgECFRjOsLaJHV+j7Zc76HxyqycTLjyL+mDSdkgNxZau/iQWA83YFWXL
         YI2aLmCnpy+klMhom4NDVlKEbfv9yyO+05r35QCYl4COBW8rjMkBh3Z19LZI42g9zdXg
         c4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764076293; x=1764681093;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gex0VuVWdS2A7t+fRRBFD5J53buVyo0CPv6AtLlKWY4=;
        b=lhBXxKXGOn8Y/kviFlQPyw8OMoMctM3oW5d7VUIurtsO0DBt4sXuryVjzkFAU6d/GM
         D/FGWYS1C8SnszYOo+TW7rmsjbpU4gM3epm6VS113oxhJqmI2roknnVL+jkMmU7cTBk7
         dIuZPq25hqE7NC8pLAxjJvjGPTCgcaqK2/a1ba1PQfRyzSD08NrTg/0jy3a7yKFEaEtk
         YmklumL4nkjuzSBUankSRvtwLdaC6zFMdvuyCp5rvDgwQ+RLAnMIlFVvUWSSzuwieT4X
         BSm4KUDbWUsCYZ/sCyRzU9YX4crz+lwfcq142TrEZvE6dABk0JXpisRmtGCEWtzneZJR
         7TYQ==
X-Gm-Message-State: AOJu0Yw+KzOQHPX/OBoiW5gvF6RDAWF2ykoie2KoXvXuyV3y2mfGiENJ
	fzbTcw4yobNTXQ4j1it7EMvviDdMSgygnTDCEA86Peas5+zGvmnadI9YM7Eha9GdIu8o59cqXa0
	m1kt9YjBpI3M7M17zPwxm6XepMN6gqlH2raG8I+qYbCnoc8zX1ZU9RuIu37kYqY1KUYsj+ic=
X-Gm-Gg: ASbGnctvc0dcDqdlQ343eM/s7iwf80wk2m5BI0bghkNIrpTbWoJHhqxxhpuEJKNB7aD
	fTk6H4FVitLJAPupJ16uhNzuJWXFkw53K9nnakBi0ZBAGFq4YworWQXnGf7HmQec9MVcBfxdiV/
	iVTb6jISkCmB4k+JBqf8YngxjvgDb0rGLLj/Pkblin2yNGwd+MsJqcpdgoHzMmUkikbeJh+iLOd
	X/YJlopGvxHnYQfTz+27HlMuFqZnrgUv74P+mmZERuK4lAkt4lT2g81jPFRg45huQyqrWw7HKI/
	BBPf+vKVOoXDw2gqfGewTNch0JfIYAqWgmNaQ9FLGKZg+VgdTEcqf7GjEEjHey8o6/QhzaNsfnt
	Jskq3YltXFQg9PI/K+YhRcIonFsgVkQ==
X-Received: by 2002:a17:90b:1641:b0:343:e480:49f1 with SMTP id 98e67ed59e1d1-34733f44235mr9527966a91.5.1764076293278;
        Tue, 25 Nov 2025 05:11:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZup2ifW0Sygd+wjl+5wwIHhXksm8TFGehZNRC/gXXnI9znLPolKXMTG1ufuKHCogj/WR6+g==
X-Received: by 2002:a17:90b:1641:b0:343:e480:49f1 with SMTP id 98e67ed59e1d1-34733f44235mr9527942a91.5.1764076292750;
        Tue, 25 Nov 2025 05:11:32 -0800 (PST)
Received: from [10.239.97.27] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692ee4csm16596598a91.12.2025.11.25.05.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 05:11:32 -0800 (PST)
Message-ID: <11f3f93e-57cb-4a08-833e-430c3e458fd6@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 21:11:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cheng.jiang@oss.qualcomm.com
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RDRgU51aONAUfn9vOwKxtRgSma2ApR0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwOSBTYWx0ZWRfX3MSO+WXjOtBB
 ge/CRCzYGj3QkQ5DYeTqrglkwSvCiNOiOtqjTEAmPPThwDdRhU0n2T8D9uyDU1D1xTvo7e5cQNe
 SNd57hzEGCD9VgcVHlgPq5vU0jzZXMdSTfTjoHULcIKBEGB01Fr4CWr/fLhGMRqU1ZBCZtn+qzc
 2uFmDNdLc96gsqNBoYhP6pYVwYIrzwWuZw/g4GG10GtN7YUTDi8sIsN+/fpssZG2SJUplHjh5vO
 WzLAraYLuxVrtaFrV0iB6fT/S8HzlH0DSIECqoThSvoEnTiowKnmUvEI7I4VdtW3kNBn3KPEw0F
 o3jYhI9F/vzml9QM5YuJPdC250ZmmIwbmFF26edUqqQEnC7q8eunYiLb9ORnqHxqmiQyUSwJRS0
 dFhJ45z0U2utMcV8P4vcCDu6wwwWSw==
X-Proofpoint-GUID: RDRgU51aONAUfn9vOwKxtRgSma2ApR0X
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=6925ab06 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=wLf4G-BIRvhH5teICgsA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250109

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit ff6418d185528bb9b040de1066c34fa405ecd4bd:

  Merge branch 'amd-staging' into 'main' (2025-11-21 20:17:56 +0000)

are available in the Git repository at:

  https://github.com/WeiDeng-weiden/qca_btfw.git main

for you to fetch changes up to 7cab51a8c025805e43172c1bc15b33d2258789a1:

  QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-25 16:14:14 +0530)

----------------------------------------------------------------
Wei Deng (1):
      QCA: Add Bluetooth firmware for WCN685x uart interface

 WHENCE              |  33 +++++++++++++++++++++++++++++++++
 qca/wcnhpbtfw21.tlv | Bin 0 -> 152784 bytes
 qca/wcnhpnv21.b10c  | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.b111  | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.b8c   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.b9f   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.ba0   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.ba1   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.ba2   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.ba3   | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.ba4   | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.baa   | Bin 0 -> 6618 bytes
 qca/wcnhpnv21.bb8   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21.bin   | Bin 0 -> 6610 bytes
 qca/wcnhpnv21g.b10c | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.b111 | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.b8c  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.b9f  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.ba0  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.ba1  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.ba2  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.ba3  | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.ba4  | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.baa  | Bin 0 -> 6458 bytes
 qca/wcnhpnv21g.bb8  | Bin 0 -> 6450 bytes
 qca/wcnhpnv21g.bin  | Bin 0 -> 6450 bytes
 26 files changed, 33 insertions(+)
 create mode 100644 qca/wcnhpbtfw21.tlv
 create mode 100644 qca/wcnhpnv21.b10c
 create mode 100644 qca/wcnhpnv21.b111
 create mode 100644 qca/wcnhpnv21.b8c
 create mode 100644 qca/wcnhpnv21.b9f
 create mode 100644 qca/wcnhpnv21.ba0
 create mode 100644 qca/wcnhpnv21.ba1
 create mode 100644 qca/wcnhpnv21.ba2
 create mode 100644 qca/wcnhpnv21.ba3
 create mode 100644 qca/wcnhpnv21.ba4
 create mode 100644 qca/wcnhpnv21.baa
 create mode 100644 qca/wcnhpnv21.bb8
 create mode 100644 qca/wcnhpnv21.bin
 create mode 100644 qca/wcnhpnv21g.b10c
 create mode 100644 qca/wcnhpnv21g.b111
 create mode 100644 qca/wcnhpnv21g.b8c
 create mode 100644 qca/wcnhpnv21g.b9f
 create mode 100644 qca/wcnhpnv21g.ba0
 create mode 100644 qca/wcnhpnv21g.ba1
 create mode 100644 qca/wcnhpnv21g.ba2
 create mode 100644 qca/wcnhpnv21g.ba3
 create mode 100644 qca/wcnhpnv21g.ba4
 create mode 100644 qca/wcnhpnv21g.baa
 create mode 100644 qca/wcnhpnv21g.bb8
 create mode 100644 qca/wcnhpnv21g.bin

-- 
Best Regards,
Wei Deng
