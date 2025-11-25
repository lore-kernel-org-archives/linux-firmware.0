Return-Path: <SRS0=5ycy=6B=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4869ACFD368
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Nov 2025 06:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17C68C19421; Tue, 25 Nov 2025 06:08:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 215C8C4CEF1
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 06:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 215C8C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gvVw2149390
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 06:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SxbtH8l76YXjcsOFCY2Z+E
	5XcPgZP8JU+0aeE+SKVDk=; b=KQa/x05rVpUytwQxQACPqL8Q68I98QelRBFz+j
	t4NVxpmJyxPlxX1a+uY+Ob1HBqXnXWdk7HvEfPqYS+s44EaZlT27aIsEDpl9ALik
	cL+p7mryLH6BXx97BOW3EzzlbyNlp8KY80LKGH8gOXoCVm8GrWzzquURn+6vuvGz
	UB1sJajNJJ6fMNIFsIeQ4v09crCIRBnBJpL7bgTcb6z7Bt59txclT7QRCG84DnRU
	3dtJCAePfpIVK/w9pHyIYxWrmRz45Ghg0w4fbfyKNMpPIWfsBShKcBtIfPQTNUF4
	4tr12wlzNgUkqbJhBcWF8n0pKvSDyy8vM6O5Op6Ha9V5ki+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8sahkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 06:08:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b227a71fc6so143001185a.0
        for <linux-firmware@kernel.org>; Mon, 24 Nov 2025 22:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764050895; x=1764655695; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxbtH8l76YXjcsOFCY2Z+E5XcPgZP8JU+0aeE+SKVDk=;
        b=V6yX2Ay7iz5NwWzpf/yHlXyGvL11TNt5EwLSRi0/iN2zPWEfMcn92PKh+q1W3tWR+Q
         AIzxhRhSRIexZ0XRqtQxAzBHfvzn8yA7btoFGtqYpZa71pnhWMyZvrge/wt1/rCy5oQ+
         iRssUmkgoh+KxEjENJ5d9UK0IkI2Cz3HDs324MupJsBjFU9vMWATzvxN0CdNx8qc1ZCc
         K/68D9o2zT2ASewvVvfk2bB0tW7Ja9QRCazX7BadY3kZgxbDS0gK5RxmUk5kl/9h0CO2
         s+QtdP3TYR2lkvyww8dAQQn96H0cMYWgQZ8EODI2kTJWMDrLVXJ3kUJ6FDBqaHlX3ufQ
         CgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764050895; x=1764655695;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxbtH8l76YXjcsOFCY2Z+E5XcPgZP8JU+0aeE+SKVDk=;
        b=deY7FSGBNrAImzdUpwSwSuTc+V7SMCviboLI4Dy1y5zPbt0nM/PHD2YXYSUu9lxYVt
         4DtmB13+wN/a2fqHM3T6lQSGeQtbem3VyWOsOV1QcP9YglCoXP46AO9kl+S2ckwHj/bI
         YOiiCOqc7s5Nulowm3AZQNwaAXAs4tX/KpnNZLitryZyMs4xJNc36zB+ZybuJtZOGFGA
         PIuTxr6KSyt2I52O5HVmwooQ6d7ckV9WAzqXSOoPyMFJp2QsvvW2F2RETCbO78pgKozC
         zvMJEHD51Yk33kQPkZJRIUO0NJRWIzEwMbWfsWl4lcdk9hEa4nzEYcNBcryHWw8MZ7+x
         13Gw==
X-Gm-Message-State: AOJu0YykFvgvbb1JhpbxQdLJJETIyt2VliV1q1+vcHOfw261bMgc4Bxf
	MhjpgWJK9FLpLW8bwWkNAOqH1BrvS0JMWVcKrvLuF7ID6UhPAOGI0Rb1mPpuuc1GVcrEFPWQP4F
	98IHVE716u5KK4huGwe0e0Qv2hrs8asBreS/zBIYoGjn0cxBsly8cfutV6cu+E/gjYgchOjg=
X-Gm-Gg: ASbGnctkdfrYM/xg08nJ3qhqfbUjbdgZVa4R3k0KALScIH1mCjS2RCRVSzsB9DTPbQM
	GwU6Zy3Fexu8yAodtooOVmOGkGaoH6z9iLP0JZkcBOP1sB4rbD/l3z791ivrcHqh6h/WHlOp9QJ
	H+GKjn0/JLQ+dXydgpkgPmLg1d8Dc2ETFPXm3K4MtCN3n7JDIpIm4jA4yj7VxH87sAixDQmDn2U
	6dDMl8Tqic4y9IozEO/SB78bpPNrRULOK7bUnrCGL/eBvkon0+eQ1N0fl510Wr4dJ0Rm4SdMBl5
	0nWB8hCpqnDqrUw2nsa7/AflLSeDfonw9KAjP6Tr8KZOs8xIF2X5LGiV+UoC9TUAPKcChLG+1nY
	wFasyFWQJz7+nYh9HE8U6PmK9h1CanQ==
X-Received: by 2002:ad4:5743:0:b0:880:4c44:9c69 with SMTP id 6a1803df08f44-8847c49544emr171620206d6.1.1764050894970;
        Mon, 24 Nov 2025 22:08:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQsLx08FvPJVgB+xTSjKZkj1e42i+7ekNCYk6A6Ga3exjixr/Bi8pO6/9L+MxiHvxHkpuO1g==
X-Received: by 2002:ad4:5743:0:b0:880:4c44:9c69 with SMTP id 6a1803df08f44-8847c49544emr171620056d6.1.1764050894565;
        Mon, 24 Nov 2025 22:08:14 -0800 (PST)
Received: from [10.239.96.29] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e445b1csm115722506d6.9.2025.11.24.22.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 22:08:14 -0800 (PST)
Message-ID: <897a0b73-8903-42f3-805f-1c568c93feb5@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 14:07:49 +0800
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
X-Proofpoint-ORIG-GUID: gBguXH9L11DRR-M_xI5xGD6oilF7i3QT
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=692547cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=DyTTI9odfht_oEvqeY8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA0OCBTYWx0ZWRfX5z4DFIwOScZP
 9BhakuyxAL1XqIGGms5s1MvEWieVx8KGX1L9EFiJpFyCkyEl63ssVMQJLEwelBtDny9Btgblc/a
 6hciuslCxHg/qSGppt0ty/wA4pGiFftFADBaVdGjbHPaFU4UTXDNi4QpqcfFhzmi9G4YzBzghmx
 GO70vqZV9luSvAkbwXWmTZrC9kVvuOrWMx0hfszd/mLeqWGzbwIKk4FseXKlOcxM6Rv84Sfl/Ef
 ptu+sL6f0Woo6nnkvIQ5BWZhaJ1T2ZrwXOrgJyIjWnTvPdBMXlaaWfGyQjx3+3LCvPPTA29WS1s
 B2o8cKG0Uiftam+gHUuBJLJi5vex4MhgLFVYVDYLC7PNrPLZQsZO2i5e6eytQpj3jUxp2VzOVyf
 Lo+9ubaoEsK6Nj5Dc8BSHlcu9iQm2w==
X-Proofpoint-GUID: gBguXH9L11DRR-M_xI5xGD6oilF7i3QT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250048

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit ff6418d185528bb9b040de1066c34fa405ecd4bd:

  Merge branch 'amd-staging' into 'main' (2025-11-21 20:17:56 +0000)

are available in the Git repository at:

  https://github.com/WeiDeng-weiden/qca_btfw.git main

for you to fetch changes up to 6d5c3fc550a66ec5b778fbc633ab1720a3acbd6b:

  QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-25 11:06:48 +0530)

----------------------------------------------------------------
Wei Deng (1):
      QCA: Add Bluetooth firmware for WCN685x uart interface

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
 25 files changed, 0 insertions(+), 0 deletions(-)
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

