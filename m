Return-Path: <SRS0=x1PU=E5=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF26C43458
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Jul 2026 06:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF5AC1F00A3D; Fri,  3 Jul 2026 06:38:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1783060705;
	b=Ql6Tr8naySIsB1y4fhsRDNUhN1RMCIFNBrgXZi8+hwHuROs/uJl1N7LWfTGbVjtRkNy6
	 CYOLLahiZ8fFlqpmcsgYgFiLh3EjxujzVQrYx98LB2VH/2Cr9/nPT+bDJxt0s5Pr2PPQy
	 xdEdg/EZnqBjmth14zJXCmhp4lyfepkN01uIH5zCflYae82Ed67z/OXRKTbkRvuBDy6Tl
	 ahHXdolUoph7TVJVRVb9pkU4ftD54+0ntpgj8Ql8rvUAOu+QtwbEGmhgBX9/sOjow3JDP
	 DUFf7lozq6OysS5DLdVHsvDfx6ajlzVvij+MAjiq5k5r0Y6B/C/M/LoIFeJp6x9VOLA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783060705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:List-Id:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+RIZaYeE6SCJ5WHUkBP8CpKnQGNtToeGw4GGWD5sMHQ=;
	b=oAQcUa33Qjudd6VsiHZzkQdkhYjmnnJd01IFbB+bDGVifD1OrXimOEov5vioze2E58wv
	 +VzpmynfOAReRZ7fpCyT9WZ9E1Y4DBXpkNaW33YXsVqVJBCEd3Su1rC6bfnM1Osealof5
	 u1v9lMsbmIcVzbH/Isa2KzUSMLkP9R++YnufQLd0Fqps1Xz/SF06urrpvITAzi6wxtTEZ
	 /EK6LE8DDb4cSoqshzTe0AG6Fm6QmkzB/7a8eETxrYsfO+ZX8QRudSbQnsGwTFugbGXhH
	 bERl68BFziYiAHknxDNlhrl+ZnrhRIiEThBH4aMNOW0gjD5EftflD9wDGw2L1JePVVg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIwOUlAA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KAJSOY7s;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 156411F000E9
	for <linux-firmware@kernel.org>; Fri,  3 Jul 2026 06:38:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIwOUlAA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KAJSOY7s
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 156411F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635riXu3147413
	for <linux-firmware@kernel.org>; Fri, 3 Jul 2026 06:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+RIZaYeE6SCJ5WHUkBP8CpKnQGNtToeGw4G
	GWD5sMHQ=; b=NIwOUlAA0t0r7LvGUwxmWLjlwD7dcE3u59+PLq6clDgg4FBe+bO
	tI+6vcnbtUT3BDEMjG8BJDPFiDHFvX+HBQhlsNzCnXvxI1b1/sYYzQSVer9W6W2n
	RnE0e3Z+YZL6IqgiFjsZF3qBST+uEnP3cWFFSSNRM6T8Qy4wKK+zWWNyA/yhW4fO
	tmTxDaAD7PuvuFUyUZInjuzU0zmadzoaO8MerqCBjtf8FVsWrImxIEnPr7k8WLCo
	3Af9vM33hHqAywFQyURYYPO9Tc6iTSbbYxF4UZCN3EBf8zZ4zVsEE5Zcb7yUvrn/
	+Gohu/q+HndupPf7vf6VvcggyO0zwzj4Jag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwvusv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Jul 2026 06:38:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cac01f64aaso640595ad.3
        for <linux-firmware@kernel.org>; Thu, 02 Jul 2026 23:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783060703; x=1783665503; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+RIZaYeE6SCJ5WHUkBP8CpKnQGNtToeGw4GGWD5sMHQ=;
        b=KAJSOY7soEtqSscQJ45UXNn2QfWBBr+L3QemHsomTfZQ0OHD1T40IZzufBNKJ3O6ZW
         X64V7skwI4s4rKj/f64g1KztistgyyLb5YfjcnxCR+aAhUerzVjpre4Ik5dsi5VZg2u8
         5Izo7ilHJcUMbBjUxV0/PilzQ6QT2/HuD9g/Tb8QTHlDaOYrygkzHLXrMuDShCQ3pKKl
         jfslkHoY33/bzHXeo9vM4XT7g+CbKCYhCKoaAH0yIOIsk3DIRaNcNYMGlbv3JKcuJdNJ
         AZX9/LYK6skDVojKsPMaro6nzn8tMe93sFnMQyV3bL8KBNGlvIGVKPenW8YHCqyR3Bd2
         bqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783060703; x=1783665503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RIZaYeE6SCJ5WHUkBP8CpKnQGNtToeGw4GGWD5sMHQ=;
        b=fx4cTyhrSAchVHTndxZImIYznP2cwlaJqutr+OO6dtoHGsaaqe19XOtK/sM69ajba5
         0ac30jgK+KfQ4pwsXozUzBDNKrY0MNhnBzgoadRmYpD9Dg52UHl7dOZ293XFpAfLITjt
         D7w1Op19yr+r8Xk+FgAyQiItM0ad3l4D7+MSgBOHSY81o10SvDwYX4iY53ejjhBhBft8
         ofl1fch+E34ZGBFdcksEVImjmr1E7tnVBq9eld/IBUDFgtTDQSFJA8zsadHd7Pp+0tfj
         1hiYih0x1aupl9q9G0J7SGoubSst0m8vluOFCaZTi9wBsb1/6V143BKZRJJkVHannR0/
         fkAg==
X-Gm-Message-State: AOJu0YwkcLDSuKWikj4uS4xe2FyOpQnuxEUmuvVzYbDJXe6i/Em0sQLH
	8M7/XgL8O7MiVB2y/Q6AR+aTtoGwdGfOuXM1UjzvcGKGgLafuXl/Gv0RXAKlcLgTGgvJtZnDVHB
	EPIj08zEtpxGPTm14BZMvxurkwHuvtj4OYozLkyltzs0ILzKfvLPrQsY8q6oaZ78ORe8fHqs=
X-Gm-Gg: AfdE7clFRsaB8QnqvY0kpp487bUUO9d3B6eDzYgwC2Tf9G0fndsS1z59Vp/6Jga/BVZ
	N6UORmzldUfcEpvmOsEAkSz834UGeVPE+jRAOzOm5mwwLYplI6mdbjJNXxnalts6EJc4zzPKY1f
	/5nAvTQEyb0DcMzEFpgZGqXQ7yDQ5Uno7WLeHY7SVVhGT5OKrz2LhrPq6cVS3ms8qD9LLXtYnfg
	xAFg1IDlkdG3/44F6YEs8jaiZI9rlR59dFWmsrmAsqLPdga3YyqXsOXj9R/tYuZUX4XscM4qzSv
	oDmtQvMwWJa0zJ+nJzFOwzWHmPVoY4DbGuWDgIy/UArYtj/mS4SW7GkH4mYpIE9x0g6HKDeJNHZ
	1U8+/oUek/NDMKaM9VBhclie0mFUejm4yA4jikas9c3gSfQgVQhphJN4cDUkiPA==
X-Received: by 2002:a17:902:d490:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2ca7e8cf2e3mr60005715ad.4.1783060703299;
        Thu, 02 Jul 2026 23:38:23 -0700 (PDT)
X-Received: by 2002:a17:902:d490:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2ca7e8cf2e3mr60005405ad.4.1783060702777;
        Thu, 02 Jul 2026 23:38:22 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm11004635c88.14.2026.07.02.23.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:38:22 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, cheng.jiang@oss.qualcomm.com
Subject: [GIT PULL] QCA: Add Bluetooth firmware for WCN6855 ROM 1.0
Date: Fri,  3 Jul 2026 12:08:18 +0530
Message-Id: <20260703063818.3129650-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wYQ8qUHSgks42T_sFqSO3xN0XJdHN3F4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2MSBTYWx0ZWRfX2rdlp5zjlmc+
 ZqnJaNEN+j8o/cJei9yUktZvYb9jij5SabdfxYbDEZKB2h0XNox7/v0rFDjvaeEoVWxuGKWtS9t
 6YtL4MUL5xG8q0yTxaBSXP9R5M/6TvxsMB8ZbrMYm3vDlrkGr5c+ELaEg0v/o7tMlrEn8Sd2zb7
 uJ9aoQctmQoQajY97zRm4/MupDkv2W5W/uRjwOoEIByFhdIjCV2ZZ5FS0FDgJf9fuq7ImOTLdOz
 oRGKIAb6kTkztAzEyLOwYQjxySezX4Igp33a6SS8IHIa7c+jEOesutdopvTYj6wbR0JYIlQ1Y+i
 y1DJy06C5nwK2apHEYltAjyqvPZRkbUiHw0YZRjrbFm/Jgy1FjMjKhLkbFuGs2oVQb6XdhaE17A
 lyAnhP1znOB7SU1V/Vwd8Z01Tkhkrhw7QWYYkUIU6k6IlXXKX+GN9HDFbwtBYoWE0fe9I/kPj1R
 AvNOgE7WU5sOne9KTWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2MSBTYWx0ZWRfX+xWqZNG9PAXd
 XVuIsScJINsV3FxX2fYBb6NHJlr3Rw+BltsBu9uDg8PZecOk4c7lNvg5TIsnGpOSXAOTD8PVY/F
 b3AUUevSqyejmtQA2TnfAQfOEG90Gas=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4758e0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=pAtyQu15WFwe8dIAr00A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: wYQ8qUHSgks42T_sFqSO3xN0XJdHN3F4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030061

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 456685425c176d8a668a9cd5d69bafac568947cc:

  Merge branch 'robot/pr-0-1782995542' into 'main' (2026-07-02 12:42:10 +0000)

are available in the Git repository at:

  https://github.com/WeiDeng-weiden/qca_btfw.git main

for you to fetch changes up to bd651de1f551cb19a8941c6e58d595071e03e2e4:

  QCA: Add Bluetooth firmware for WCN6855 ROM 1.0 (2026-07-03 11:59:23 +0530)

----------------------------------------------------------------
Wei Deng (1):
      QCA: Add Bluetooth firmware for WCN6855 ROM 1.0

 WHENCE              |   4 ++++
 qca/wcnhpbtfw10.tlv | Bin 0 -> 203932 bytes
 qca/wcnhpnv10.b06   | Bin 0 -> 6271 bytes
 qca/wcnhpnv10.bin   | Bin 0 -> 6247 bytes
 4 files changed, 4 insertions(+)
 create mode 100644 qca/wcnhpbtfw10.tlv
 create mode 100644 qca/wcnhpnv10.b06
 create mode 100644 qca/wcnhpnv10.bin

-- 
Best Regards,
Wei Deng
