Return-Path: <SRS0=4xqf=27=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5476CCA0EE9
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 05:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23DF8C116C6; Tue, 19 Aug 2025 05:50:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED607C113CF
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 05:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED607C113CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INiKcW002261
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 05:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yW1M8PY6u2/Q09104frDHe
	qfpaQJDv7PiabNCC+1kRU=; b=RcUm+YHD2+Seqj/QLMVu+iEu5TfdJa9gu1oRQb
	ICDsl7GFNWtVw4c2146vLfi2NTH4MikjN4iuXNu4UKn/cHAjJt3E2UYQzaA1CVGh
	h/OY5DZIvw/QA/nBZCuxaSDm5Q9F1+iMF88tqWOCOaf8jyaAp8wNufHsPdsPXdrK
	KP9jZP8r9Z+1aGhjgHHEzTsJdLcUmhBCFyyqVshdxxdWR+dTYftAnxwVf/rlLdOF
	BKkAiVBoiTsBlFVy5iPfh19TxJKQL+5Y5VFz39C1Y22TxG6UTk90pXTfPxNfL7lS
	ega19wJV5JoBHGMzDsuw144EuNXw1Ippwh9fCTL3n3FH42BA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vja0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 05:49:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471757d82fso3917539a12.3
        for <linux-firmware@kernel.org>; Mon, 18 Aug 2025 22:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755582593; x=1756187393;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW1M8PY6u2/Q09104frDHeqfpaQJDv7PiabNCC+1kRU=;
        b=cwusGcvMj9y3IfycHT30iBovSatb0yr9pwAT/k3XcthJkOCMqjDEhbOzqqrFA4KzKJ
         09KslTpURfZ+bLxnc4ykjpev/vUBlbaA3D1jeHHKmODxm+igf9/5M0na8f42mieyzRJn
         Kq0PSpBLBf/VUlCGRxq0ystieySrKQnYXLGsnl0vTL3LU5CJT+CTvRVumYdutCyEn70a
         1qdQtl7Cys8vH6ctDvku50jTsSw4STccnc4L+8eMo+f4nbULqaHS4rWYAQSFJcfER1Zv
         pi2HAiO2SYw0NZPPGsxfJON5f2g62MwhnzJ6d6CiGcDfICyouQ3pd8V/BglJnQjBjA0M
         xP+A==
X-Gm-Message-State: AOJu0Yzs5+WxVwfwgQ8+GlubyFtwmts1Veg4JQTBwuTOcuY2r+ThG3pF
	bJIyJ3aSXgQowO1RMY4iTSbRofIUvI01KwO/fAVgbsUrE+SP2UMaJyHcbQIzzNovFRduCv5bUVm
	OJUds/k//ZDIOC4ZjPb64RUmSywh5RQ+bbAr3qffNSt+X9ua5gzsQhfaLF41t1lg5QYL6Gva6xw
	==
X-Gm-Gg: ASbGnctfz6p1YB486Olp3wCC7CEoqNKjOjXZds800vg67JdOM4YOP4SR55LWBG2qkLZ
	KnExZW6XqCWS3PVeANyrcFpyqC5JMKDmmQA/h/5bhwXLRYnaPJlCMoX1sOWXUvjmF1jWSZfVIS3
	xtYZZ00oArPO/Kc5HdWnduz5MqbeICZwdMpKpIvVNyEXrLYE47y10zU4nMHtTpDz9pABGD31wJx
	/IDn8UY7LdDXl3IVxsbN5i6ZntNqGKp4Usb64H+caipPuQ4GLNXaJVptpeYP6eIpiIh20JPKMow
	WxczAHKbatW54IGasgFpe/Rip3o9jOCjaCfEosCcdbBDN0LJw50pf/J5dVTpskzbEHQKw51vwP/
	H3JkDvj0QNOAP8ro4G+BIdVoteB67
X-Received: by 2002:a17:903:1aad:b0:243:963:2a6a with SMTP id d9443c01a7336-245e0541f6bmr15750005ad.35.1755582593097;
        Mon, 18 Aug 2025 22:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGueVzdoPHiniJe916EJZVZsxpn3wziuf3xFm2OpzvQqWzPI5qfF7XUqsNw3XStCBPcEskrFA==
X-Received: by 2002:a17:903:1aad:b0:243:963:2a6a with SMTP id d9443c01a7336-245e0541f6bmr15749865ad.35.1755582592619;
        Mon, 18 Aug 2025 22:49:52 -0700 (PDT)
Received: from [10.133.33.67] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9dee8sm97860265ad.9.2025.08.18.22.49.51
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 22:49:52 -0700 (PDT)
Message-ID: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 13:49:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for qcs615 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX+33Kqvn8fgu2
 Xz8k8M9mBMmiaxQ0WPcWeYEgGlAU9KdcWndbjUxWx4Ck/feZ+PBHKBT0pDdzU4ibGA9u3I/q7Wa
 +Vxzkf2EHdA2kpPr+dvOa+uOPIkLy1FiXoVE9xvFiFTX0jdDry7jJUZamYt77iVkrQECtpeGZAA
 CMDoJ/AxH90oX9Y9SsOJwXa1NqvKkxQp8Z8l2r6h/OQbPh5MrPiOrr+ezBBnmq/r+XYt7ksVV7r
 UOM52YZkcOzXbwU3V7DSGIVQfNhes3kS9cIFc7jCV2rhTOh8hC+XaCSWB/2UHTeWcHsliI2t/pp
 J8gWVUSodbcAboJUCG6NwD9VExYV3Hn11EGmfi94KcdBNLmSq8hyUOK3kfmype5lQ1rUYOzlMhJ
 GQTE+0j+
X-Proofpoint-GUID: qJumfVqYmVttuZTnTas4hG4q1BMWSdLK
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a41082 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=76PSn_A_iJ7zguPXqNgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: qJumfVqYmVttuZTnTas4hG4q1BMWSdLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139

The following changes since commit 72a326cda49109765396e08f2453c51a852e3ec6:

   Merge branch 'robot/pr-0-1755548398' into 'main' (2025-08-18 20:29:21 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 819-cdsp

for you to fetch changes up to 3611a33e984859def7308c94db9c29bc39e91a94:

   qcom: add CDSP firmware for qcs615 platform (2025-08-19 13:45:33 +0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add CDSP firmware for qcs615 platform

  WHENCE                |   3 +++
  qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
  qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
  3 files changed, 24 insertions(+)
  create mode 100644 qcom/qcs615/cdsp.mbn
  create mode 100644 qcom/qcs615/cdspr.jsn

