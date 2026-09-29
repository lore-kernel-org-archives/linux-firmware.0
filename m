Return-Path: <SRS0=PC6h=HV=oss.qualcomm.com=jinwang.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F59C9832A
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 03:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA3B51F00898; Tue, 29 Sep 2026 03:45:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790653538;
	b=dT6GLfbE32XcLFeJQMxd92QoDyIFRbs4u//1l7ZLFWt04KZZ1B48Dd5yfhywNSXqBR4n
	 XmjCcM3uDEbco13aXQ1gKvleScPXqfEGTdlgWwl76UPYH9FRXjuUfim+0gI8jXQXtUo9C
	 OM58fGD3QdcWhf1o0PMv7fVidLDv4L9zMc4S+F1M+M2b+I1ZBpEZdECFenw6BySUKNNQp
	 7c/MzgY68F282uLZrV1JnCbZgDuUeqxxlCDaeZOJ8nzz+x2+zsyCAoExC+uIS4+9vyEr8
	 xj+78wsnJ9KmpFxx8+h/dF7TqvxjTFs0j/7B75cp3ou61SDl/ZnI7U3bMKdVEuTFyjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790653538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=805ahTcaB20wRphfpgZ7XuteWpEhOqP0VUm3gjLYqCM=;
	b=PAeLwi+i4IHSkY1lI8sNqtrrAVttCyc1FkrSNKC5ZhTGoMr5h9Fwinz2RxclXAN1cR/L
	 rkGvvCmcTR5Up6G0Tmv4kn4J5ZU+A84hYjXl5RSrRkqDXRh0WpkThpP5taSEf2/WwzT7S
	 TCY8uUFxUN9KtYGQECRi741+2UrGyTEuDFdG8z8f2NQVYJn6cAVV4w1cGqH3xwjKRBTKk
	 qteWFlOo2ZB3PZcRi2pcaakuC+sjNQaW1BOPVPcLXXA0YfpZ4aJ/UYTfbaOa3XYE2q1kJ
	 evzDhBXqUMcGWeyYK/LwiqieHowxL2soDSh64qOdzOwxg5a+EaHHH9COgy2svqt5P8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQilemid;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOBeQrrX;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3284D1F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 03:45:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQilemid;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOBeQrrX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3284D1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0ibYa4180024
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 03:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=805ahTcaB20wRphfpgZ7Xu
	teWpEhOqP0VUm3gjLYqCM=; b=SQilemidBOk1/s3xD7aTVEwEOqg+gCKbXbN9NU
	JYyY95isW4jc2R4c3X6I77YhML6F04NZ6ca8gGEbiMsfD7mmrCGlRKNv0JFmx72+
	C3RLlRad2k8KlXFALzg5cWiNgel85ooS5YbW3EKSGlBLqSSJQxKHObMaqQMcyo7g
	oMt5AbA312MUKoADqaj85k3czIWEinU5VIb7CUF5yZ4CZxuzff4/xWY5WLamGf9k
	gXm9Evh6XAFqFpWv9n3jCYzsd9LeV06d4dcUAZDXoOKE+5bZNkKN7dlfspzqbqBX
	o25lQbiq6CghFfVWySM7l5+U8/VJylFW+DiQ4W+yXvNBOdNA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmu9f6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 03:45:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso894717eec.1
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 20:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790653537; x=1791258337; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:cc:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=805ahTcaB20wRphfpgZ7XuteWpEhOqP0VUm3gjLYqCM=;
        b=TOBeQrrXNG6Ybs5ayjuM1ShiQUeeF2gOf2mGCE4EB/hm/wYk7B8OREIepyV61JgO8z
         iGfkZ0uv8cJ5bNz1QqTI6N5meOGAe7wWL1gxStt6v94pD5GpuOOpjqh+RONyteVim2Z7
         6EC+/c7lO+fNGU3RBemunAHsC4V1ZFV6seoJ3ZWSdX0lu+V0yEL+S+tdPWmIwuCQBI2V
         LJ4Onm0QrHxpUkJEYjw+lJ/HAJvzFsztiMshHNCBJf/2Fz8oAFNZ0fCvoVOEoQjmsPrj
         xyiOH5krsC+YBSUqJQ9EjCtARKQbBKPt1v7BN6ZHINnFVZ5UAb6hrja1ekWUIMtT21ur
         +xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653537; x=1791258337;
        h=content-transfer-encoding:content-type:subject:cc:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=805ahTcaB20wRphfpgZ7XuteWpEhOqP0VUm3gjLYqCM=;
        b=M8yTeOPi2djVsux+YwLvZ24PsgjO1iREzjJpoib/LrpHhJYYTmBmPLsGALKFqGJgPq
         79qzvvjfHRzczhRFj61/apVOHBMVzZlb4NH63lOli/u2+/Qafp2ooeG7xUqSIvWlUT5g
         y1LJ9YPjN3F7fgfo5O6BKrefVnjILhnBSSYm/FCzJs6kPnqho6KsDWj0P9h7xnNrlRVW
         +trz3qwza0Vj5V0MMaCAAOLhFjV/g3VnoDxXERcxBCUAWOIGV8woE8eITxLI7mQkW+o1
         OEMzUhBnACFH4vHH6lqqr41xenUYQCYMjq+x/IPyfrXt0PRwRao5JaDAvz4PnCKuOvLp
         xZ1Q==
X-Gm-Message-State: AFuF++kg7IJtzJo9YWd0FOJj/rbEv5dCSLVGjXewSHp5U4CdeGAI7dKZ
	KJzDDKWQ16aW4zSymyq5Iy4XQifttLCEwGvdXcI1kNVQHYrZrFOaGJnAZBFuL01RKZKHLFhKK5+
	T85h5i2rDZLJX4KULT4KY8UAUr4rgPZVYYRbFiqlQL3BaRC7BsWTNXnJjbdDzgCMAZSC0SwA=
X-Gm-Gg: AYBFou23GEFrw8uqjpGub1vtgwLHhR9BYrURYzMAezy7MmZnhK1nt3nB9cz4wWRpfM+
	fmav92IVJZXEU0/rjicoVsysMn3zWd17qB0or8OMuI0GXUesnFmCav3Xey0UyrIEUbJL/xC9fPh
	JOeNK+5XoTsseyPzZMpDdSFm9kAvvmcgPShFJOtzzez+mMexeALXK4UD2nPKURrgOXW5eGIWi5f
	tpq1xtzVW7HblvdOTamonIhOe9PRUQ6BYuHxdIJKWrGKb3juO6Hr+0+6OvAI+wKsr0gnpJg/BMv
	lZzSJ0PntnxiqtviAW94+N7c1rNRGlxB7Vsjxoe6kYLIXDxJwJjZ1s4sPohT9n7Q2kXnK5M5j5B
	tsS+G6KUvwBmilBOShWjpD09pAIg=
X-Received: by 2002:a05:7022:7f18:b0:146:f0f8:cf50 with SMTP id a92af1059eb24-14b2e52d826mr1816932c88.18.1790653536605;
        Mon, 28 Sep 2026 20:45:36 -0700 (PDT)
X-Received: by 2002:a05:7022:7f18:b0:146:f0f8:cf50 with SMTP id a92af1059eb24-14b2e52d826mr1816894c88.18.1790653535894;
        Mon, 28 Sep 2026 20:45:35 -0700 (PDT)
Received: from [192.168.31.121] ([58.247.180.211])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb6b9sm26321508c88.1.2026.09.28.20.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 20:45:35 -0700 (PDT)
Message-ID: <70dcc907-c20a-43ae-8df3-af11c6e92ec5@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:45:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com
Subject: QCA: Update Bluetooth QCA2066 firmware
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNCBTYWx0ZWRfXxOT9bhSc5XNt
 q0WjOGvpIvJdxbelmvcXV4JTgUxScicInBHvq7x+/PcsgyBCfb4N/IHo+o3LtISMCQRJUJz6kYv
 Fwkd4eFmYSWrDVOz8vMDkcqZs6D2zn2WuKtUb8jKpCT53xfEotWt/l1J15gbu/HCt1tOb+Nj0V6
 SCZ8UMmuveB7ig0b8M19HZLxq7JOGJ0GvQ8FqCMzxKU9BdHoVbUbfToYromD7Acr6OeGmXRMKyt
 jmJGHsZmd8WUxckogxr2zBn7PRGYfBbMjiq259HVVKifhaau0LXoMwbbgPVQzZpEggV303Y/mnU
 7h6JX7ijDCd3Ats7D1gLKxpZ+jkcll7w+MJPk+BZlciG9swpUFWFPP85KWtFxClS0GOVjTU3tGw
 LVG9xgE5Hig1de1y/egbmVivtZbbNS2T7EnjPT/sM6xfDCmM1A4vCLdyRv7odIK5EXjKRBFfcKK
 Ho2pn7KddoEGOMB8ZeA==
X-Proofpoint-GUID: 0PuTxP8hU5fNOQ_RJE4fZiBoJ9NBzCq-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNCBTYWx0ZWRfX+fcKDK9/wywa
 sLoLZD5Jdjq+q6urjwHdVfYEyXicdqSQxQCDJdKw3aIv3vANEcvzRiRXjb6yRHZZUfOmH8iNw3z
 J5XpTk0eICeMCZ53dXoxlZdq7jf3RKA=
X-Proofpoint-ORIG-GUID: 0PuTxP8hU5fNOQ_RJE4fZiBoJ9NBzCq-
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb3461 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=6ys7802BvytzPDmX/GRlTg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=PfR9Wuq3k9FvZ909wRoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290014

Hi linux-firmware maintainers,

Here's a pull request for btfw. Please let me know if you have any 
problems.

The following changes since commit d091548b0825f449581e4f58f94fb793d03cdf3e:

   Merge branch 'robot/pr-1-1790599378' into 'main' (2026-09-28 13:15:21 
+0000)

are available in the Git repository at:

   https://github.com/jinwli-qc/linux-firmware.git update_QCA2066

for you to fetch changes up to f830e56c110c727e8286eb1cebe18f6f1d9331f6:

   QCA: Add QCA2066 Bluetooth firmware hpnv21g.30c (2026-09-29 11:26:40 
+0800)

----------------------------------------------------------------
Jinwang Li (2):
       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
       QCA: Add QCA2066 Bluetooth firmware hpnv21g.30c

  WHENCE           |   4 ++--
  qca/hpbtfw21.tlv | Bin 160124 -> 163332 bytes
  qca/hpnv21.301   | Bin 6876 -> 6876 bytes
  qca/hpnv21.302   | Bin 6876 -> 6876 bytes
  qca/hpnv21.309   | Bin 6884 -> 6884 bytes
  qca/hpnv21.30a   | Bin 6917 -> 6917 bytes
  qca/hpnv21.b10c  | Bin 6618 -> 6618 bytes
  qca/hpnv21.b111  | Bin 6618 -> 6618 bytes
  qca/hpnv21.b8c   | Bin 6610 -> 6610 bytes
  qca/hpnv21.b9f   | Bin 6610 -> 6610 bytes
  qca/hpnv21.ba0   | Bin 6610 -> 6610 bytes
  qca/hpnv21.ba1   | Bin 6610 -> 6610 bytes
  qca/hpnv21.ba2   | Bin 6610 -> 6610 bytes
  qca/hpnv21.ba3   | Bin 6618 -> 6618 bytes
  qca/hpnv21.ba4   | Bin 6618 -> 6618 bytes
  qca/hpnv21.baa   | Bin 6618 -> 6618 bytes
  qca/hpnv21.bb8   | Bin 6610 -> 6610 bytes
  qca/hpnv21.bin   | Bin 6610 -> 6610 bytes
  qca/hpnv21g.301  | Bin 6716 -> 6716 bytes
  qca/hpnv21g.302  | Bin 6716 -> 6716 bytes
  qca/hpnv21g.309  | Bin 6716 -> 6716 bytes
  qca/hpnv21g.30a  | Bin 6749 -> 6749 bytes
  qca/hpnv21g.30c  | Bin 0 -> 6458 bytes
  qca/hpnv21g.b10c | Bin 6458 -> 6458 bytes
  qca/hpnv21g.b111 | Bin 6458 -> 6458 bytes
  qca/hpnv21g.b8c  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.b9f  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.ba0  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.ba1  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.ba2  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.ba3  | Bin 6458 -> 6458 bytes
  qca/hpnv21g.ba4  | Bin 6458 -> 6458 bytes
  qca/hpnv21g.baa  | Bin 6458 -> 6458 bytes
  qca/hpnv21g.bb8  | Bin 6450 -> 6450 bytes
  qca/hpnv21g.bin  | Bin 6450 -> 6450 bytes
  35 files changed, 2 insertions(+), 2 deletions(-)
  create mode 100644 qca/hpnv21g.30c

Thanks,
Jinwang
