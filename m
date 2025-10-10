Return-Path: <SRS0=p6ca=4T=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC13DCCD184
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Oct 2025 03:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFB5DC4CEF5; Fri, 10 Oct 2025 03:03:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79567C4CEE7
	for <linux-firmware@kernel.org>; Fri, 10 Oct 2025 03:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79567C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A2m8AE019183
	for <linux-firmware@kernel.org>; Fri, 10 Oct 2025 03:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NgAY9IkeH3NDbZbzKOKD0w
	Vj+vGi6yodj5/6fqTb78Y=; b=ckpYqRXo61oJ8q7is/dvNRg+oeGUC6oQ/Jx5G4
	i+7d1g3SyDQXckw/b624XTFHjinpOMg2AUq/mqELxjv8Y/0Z2+qA3mQWUhLv0fZn
	FZmZUfpXQ5NLntIpe6XQq9u/59Q0tnU73wtCe48LcrF8pLSYjRWAjuLR95lghiC1
	7cVHI2bzxS3/DOlA5vKYq1H+Nc5j/Vx9OeAck1wZ3xeQvLO9WlxPnFdnhCfr6eO8
	6j4XMnPtuNDQgOtttvpfT2xfvrkDd0rMDNpO8CoatInHs3CJMiiNYmV3HBYHLMnl
	iaC4D8rf/Id1PjtDCrZe3Tq7c9Qf5jtbRYoBLLicoZYrxPgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nvwh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 10 Oct 2025 03:03:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33826e101ecso6612378a91.1
        for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 20:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760065390; x=1760670190;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgAY9IkeH3NDbZbzKOKD0wVj+vGi6yodj5/6fqTb78Y=;
        b=Dvb/Ps4QxRbMpI/0b8+W4yAobyZw/+oE4w74xtZiTlf5IK8k764xJeSMBz2WHFxapI
         q496VcwmfVh/8ZRuqIfdA55XjcF7igYSLkYnmh7QzDarLoJhDx11kBUkR34kbNqmJd4t
         GeBBqUIR3C4C0avvkdFMaHi2yVy56n8Mx1giuL/cOFZDiNCjdhyc5b5Hl4m2ghntfllU
         3Xe+ewCrGJ9DRl6jS9C5Ea+L9oHkBu9kzpSVGQVjcXbBc1gR7REVHXSPOvi2L9K3k31w
         HxHWwq+0EfR2XPje7zrSwYGI6/FN4756QAXjKb8zzUYJyo9zh2jlZGluBPWIM9G9HWhj
         AXrA==
X-Gm-Message-State: AOJu0Yx3r19nHy3jCKS1ATZLN2bBJtB3kaRzJxcE0FMtAjC3Z3Y93vTv
	xTQmrqEhMr8zJ0ovHOWn2l6LyCWwcFakb7LYV4Wy9d6iHtAG543q6w7dPBIZMlU46rML53SwoVp
	z472NLojR/iHrm6gdM9Wnmku0Py7Iry0R33GLEOYw4fZn6eMqkKBbUI2s/XBqapMgMHvLi+C5oA
	==
X-Gm-Gg: ASbGncuDksP+r+VzZ516Kdtcc7uJ1MH09qhmdnGBNMKgn3vKj+ceMP3GMOM6H6nHjcz
	3yuN7lkz9pEOZ2Ydf3jc1kFb3DTJ/ckgBhQ3NhTJrA5LVzAttDpz2uXS9cgWFKDb2EBCFA2jrVX
	CSssE/k41FSpt2+GpprkmE+bopCu5M3cvndydCyN9F0Lw+xIryLHDd9cW9cierbjiRecdyH657s
	8JlXqkXOj+D6l1FYleiVvkHKP/Yh/ac8cJFiyAo7le/mkobYDc/QVXEVIjSmEhk33swQXAIY6iL
	1PDJ2LVIiMHAzGH1VgvHzVOtXLz2CgMhY2vPAGLTUur7L3deSjmOFuQ5tnPxjZuY+U9k1n6Jm7P
	0zytqgKhugQQ9Ruzegqm6uxV1xF0G
X-Received: by 2002:a17:90b:4d:b0:32e:11cc:d17a with SMTP id 98e67ed59e1d1-339eda47424mr18488462a91.4.1760065390366;
        Thu, 09 Oct 2025 20:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHI3JAa/vluxAyrzHTVNDNHCY4cok6W5AQHLN54AfF+FrFi0azEqrIfGsBdcKNqdp7cMNwww==
X-Received: by 2002:a17:90b:4d:b0:32e:11cc:d17a with SMTP id 98e67ed59e1d1-339eda47424mr18488424a91.4.1760065389770;
        Thu, 09 Oct 2025 20:03:09 -0700 (PDT)
Received: from [10.133.33.50] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678ddc9f8esm1011622a12.10.2025.10.09.20.03.08
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 20:03:09 -0700 (PDT)
Message-ID: <f54bf14f-f40e-43ee-91e3-fb3046605ed3@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 11:03:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for kaanapali platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -Wp4GS7VBkNfKj7gS5xY7i_FPT5uJStg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX21GS/86GMUSk
 ZZ9kItYw/qWJ8RUerJBC3YP+KdNtivvVbnbqqcYtrZqxKR3xekoEOMS6uJZgSzB40oYqyVEcQRR
 ZCNLyMZdLZ06r0lvDIjZG2WKgvZ3odgGEEFbQ7k7GdurctsPIB1eL4qRx2h/TBVXIDaZ/mWuPWF
 isy7ycXVeznMJQVeSDhIXOP9BTBCcm6Ngtlvzm3QLciX9AhXjmddh4sZHdQeePDi4oY9GQhVozh
 E8DSpwU/Kq3fjsPC2iEe74i8KisnQXRUk1BLEsnJGebleNbtJAPhPs/+xvVQkUwup22HyGFvZYo
 lHB+uzvZnKbA6B+HJXS66q9Blr7gNKf7BqCFaQrFzDnA5/P4WpN/C8vLDhFBjGt2FZgaFdHuUo8
 RPcUYC/6rvZcidUOsJ83pmfo0WyEag==
X-Proofpoint-GUID: -Wp4GS7VBkNfKj7gS5xY7i_FPT5uJStg
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e8776f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=nSjmxmyzIntPJDquhDYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:

   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
knp-cdsp-1010

for you to fetch changes up to 08c86848b7e201ef33b0265e5910a07e97e5ec5d:

   qcom: add CDSP firmware for kaanapali platform (2025-10-10 10:43:11 
+0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add CDSP firmware for kaanapali platform

  WHENCE                      |   4 ++++
  qcom/kaanapali/cdsp.mbn     | Bin 0 -> 4956632 bytes
  qcom/kaanapali/cdsp_dtb.mbn | Bin 0 -> 40760 bytes
  qcom/kaanapali/cdspr.jsn    |  29 +++++++++++++++++++++++++++++
  4 files changed, 33 insertions(+)
  create mode 100644 qcom/kaanapali/cdsp.mbn
  create mode 100644 qcom/kaanapali/cdsp_dtb.mbn
  create mode 100644 qcom/kaanapali/cdspr.jsn

