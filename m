Return-Path: <SRS0=o/+/=AU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A82E81A2C
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Feb 2026 14:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 435D1C2BC86; Mon, 16 Feb 2026 14:41:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DD37C19424
	for <linux-firmware@kernel.org>; Mon, 16 Feb 2026 14:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DD37C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GB4jEL1813118
	for <linux-firmware@kernel.org>; Mon, 16 Feb 2026 14:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YNf80I/6J9u5wC7DgLKY7FRn2v4hqVfbxCL
	8+fZneN0=; b=gpNPqQ/Ah51IcP2+CskfW3fhrCPWy5JTFXV3/yAo1rhCS/iDXid
	JXGu7twioQHnFcNNdKomB+v/q0QZAc3cGR8ZwS5SDo405q1IGNQxBKmgBDc2J6Kz
	8StZ0SZYP/Fhgz0lhjuA981PX/eWRu8eTg+coEb86FkKJP4mie1C3Pay/UVzyrIX
	UZZYJq65TWJmLKFs262i5BItyr1WUzJLs3YRkgAGVnzJ94WtInEkkYyN4VOFvqC4
	IMmA2Cak0ZBZ7cunattpEiI85smSxbJu9pzHW9zxcYqUKqHQXY4Ubkw1DCQIqcoD
	05Q6Oa+jbSI8ySiS3YXSwH1a2nWISagdMVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9hwva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 16 Feb 2026 14:41:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b0d938dso2110755985a.2
        for <linux-firmware@kernel.org>; Mon, 16 Feb 2026 06:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771252859; x=1771857659; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YNf80I/6J9u5wC7DgLKY7FRn2v4hqVfbxCL8+fZneN0=;
        b=dXdTmzyxJK5wWKHv/OEw+VYSGj1AP5KA6b+ha4cPPIgKMgf6LyKCEir2soGiWOAxMS
         gqVV+CGSXNC+fwRSy2WJ1QyIXK7mCp6YUi5ktXrhmQ/a270qwYq8ZgZ/PYw93pezJJ7n
         Sww873HUVTx8vcBASgsa92SXl100nYVySD2aPCOhVR8hYZbJWuOUb274e1KTlG3HwUge
         lQ45V4UZTZAohLpyGbAWIIcYI/J3ctOZQrgjKq8EVS/vBO6sRT86KHNjX2mM5V0fEK0C
         YjfF+24eMLWLcrXcefWaL7W05QjNR8xNfquj0E6x4FjV6+3pcoWzO7/disGER5dvphY8
         y0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771252859; x=1771857659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNf80I/6J9u5wC7DgLKY7FRn2v4hqVfbxCL8+fZneN0=;
        b=ol5G5T4pwz5HqxMpq4HjjwY9YC3M2PB3o9RttPcD4pBu7LRTW9voCv8/LHzt/IjIrE
         ks0wXXM0zQYVI85ltYgiQF6Hp1jPeuQ2yupyzTepO/RgJozNIlInRe3rN4TGJ+mFsCcX
         DBl7GPefxc1wGLTm0tok4JlUmQCN108569zQjNVMWw7hRkIwSx74cVvwnl44BK5ZTE8n
         ovw5MH9E4i7BpiLLjaEeHy0D5Qw9yWEyV3azc/QmEiZGZ6+zyE4TUO0U+KRqyfwxvSe/
         XZbxYZ+gdkU2Cq8izYUUY8UjuqrkoI1X+UJxEWPYSPZcTp5j0YAS+XG8WOU3erRiYsqq
         Qprw==
X-Gm-Message-State: AOJu0YzZuT8SL6jjZ3rQe0DqS9aAauT9rFGFbEH9yFAx5a5QUnp/n4yH
	2kBf+Slxm1ZYobWgAqLjstQazcjzNkF0LMoSvnI8P7HFZQBTo1H5IyzWvSUgdME7npCA9DekrpL
	jj1niGK2Kq3OxOWU6t5UYQFHqhFMsuoSqn6NJ36u0HbPGyPC7vHPPor7h+LrfgnZLZuYQnq8=
X-Gm-Gg: AZuq6aJeHOc5dtDRVSRTHzf1tXzP2yHflF46eQD1iXdNRtqKIDieWfL/DQokfRu4DXR
	lVuxB29k7InnsMEFJ8RSHz13Y6mCwqDeUmAb6Agb0BPOdWj8ZjE/bgN/HXKZ6qHRlJLQmod7HBv
	XWqGCpaqx/cGQNTiz/KlsuI/Sww+d3nWA9WSN2LwPAG8YXj0fXl6Q3XiQJzQM8XXSs7Kt1KLo3N
	9ZOyXaEPpivQ3uQXnWmiPpq6Z+J/0hEB1ulkJRDQyTFsEHBKa/z6euwC/VfAHWVog+5PsZC1N+I
	LzpnYW1kEv+GqkII39wtFliki3QWU/UD9OoN74bJ6r+vVQJa6yFHYBB8DPDz9MQZop0eApXoraO
	Mb1k1u47vWd4hU8NVeIgEV7XALiEsUsJB7bXlB4Q5bt1L58v5FHHamuXJ6vFj83PTE/msCkSTBj
	GDPTORcNTZmER/2SURaiV2E0NQLyKU/psR
X-Received: by 2002:a05:620a:28d5:b0:8c6:d343:79a4 with SMTP id af79cd13be357-8cb422b76e9mr1187763485a.40.1771252859370;
        Mon, 16 Feb 2026 06:40:59 -0800 (PST)
X-Received: by 2002:a05:620a:28d5:b0:8c6:d343:79a4 with SMTP id af79cd13be357-8cb422b76e9mr1187760485a.40.1771252858876;
        Mon, 16 Feb 2026 06:40:58 -0800 (PST)
Received: from rohan.home (2001-14bb-67b-681c-60a8-a5bc-ca81-9a8c.rev.dnainternet.fi. [2001:14bb:67b:681c:60a8:a5bc:ca81:9a8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b21f7sm3213075e87.78.2026.02.16.06.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:40:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PULL] qcom: vpu: drop invalid firmware
Date: Mon, 16 Feb 2026 16:40:54 +0200
Message-ID: <20260216144056.524560-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: feLzlZPRmZ2cTdZ0wbLZu-tsqFwT5SXI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNSBTYWx0ZWRfX9JaPOykuNt3W
 0N5aEcybK9bHsLtHAfggBI9WBF78AO9j1zn/Zv1+NQH2Jf1i1ycpdpckBsbpZ+4p8bwJoq5kRrg
 XaOI7DBKC2c/8zoDsVSuouVEfZAuoA2De13JEgqjD/nrZrdpHusQagxoPyX/RjtN5FNq5zlfNWo
 wu1UgHQJRqMKi9wcWQqnpP2MXGCW8/Tf6FygQ/OERlJeUeohwEqS5IceF2B1Os2hOEJBOzBnm1B
 S7m9EeTGVPGo6nVqDPdtoNneLS5q/auKqN/vHZg0o6bOgCMFO7PMBpMgpj08bo3Mw6FR17kggcR
 qIF+JzWvbpeNJP34AIEuFcbm3LSTjDDxDyNOc4VtHiCTYSohCapvt/EnJrIzHkZClbEfXu5qC4L
 RgwXeubijQ8qeXK1kutn+/XYHwjQhnRNCSb3SGWABrLS4yECEWreVzuhI2+nxsDc7AzbKkPEsb+
 c18Uvd17tYoB8nL/EEw==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69932c7c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=p0WdMEafAAAA:8 a=uJ8vfxbgHKKsblj_zIMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: feLzlZPRmZ2cTdZ0wbLZu-tsqFwT5SXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160125

I've tried sending the patch, but it seems to be too big to pass through.
Resending as a pull request.

The following changes since commit d87f4693ed96d0f3f6f16b0f09be42f3b8acb9e0:

  Merge branch 'robot/pr-0-1770665774' into 'main' (2026-02-09 20:06:30 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware.git drop-sc7280-gen2

for you to fetch changes up to 83c432c75da9af192f7deb01ecfe03bc5998086e:

  qcom: vpu: drop invalid firmware (2026-02-16 16:22:30 +0200)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: vpu: drop invalid firmware

 WHENCE                     |   4 ----
 qcom/vpu/vpu20_p1_gen2.mbn | Bin 2036328 -> 0 bytes
 2 files changed, 4 deletions(-)
 delete mode 100644 qcom/vpu/vpu20_p1_gen2.mbn
