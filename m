Return-Path: <SRS0=FomV=AN=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9165CE94602
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Feb 2026 20:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66CD8C16AAE; Mon,  9 Feb 2026 20:26:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C6C1C116C6
	for <linux-firmware@kernel.org>; Mon,  9 Feb 2026 20:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C6C1C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619IiOBI1924779
	for <linux-firmware@kernel.org>; Mon, 9 Feb 2026 20:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FlP/8WigIsRcy0M0emd8bnR6
	SWLSz57hj7Lf/K8LHqw=; b=kPWbSvRJtKJ8knQgy00U8C4QUgvI2k1wYImVNh3l
	f0wL5ZM61aiuvW39CZuHDnYnHhAAj5GHMeN2xSM98ynReoNlPUbx2ezd66K36ESt
	QNQOlYf9GTSUNhI3Qf4Urq+LOgLtgRtvdqLNSBTJeBT6WJC7bBZT3dapxFYnM0F8
	wD0KmDQtBjJxThMyhhBLun9VivaNM5SbAXLeaU5c3ZJWpFUnQU6F2EYHWI0BXLn7
	xDnRKVEgwAt0cUZitKHn8ADw51VWL7D0QsYBYgAWXhBTQZUlWHZB9ufx8H2TYSFd
	aOFXtZwuUf0SGwDr0JhR7K8lI4jz6kN6QQ1WDQEsdaCheQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c796ktxew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 09 Feb 2026 20:26:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aae146bab0so23955475ad.0
        for <linux-firmware@kernel.org>; Mon, 09 Feb 2026 12:26:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770668795; cv=none;
        d=google.com; s=arc-20240605;
        b=kdaEV6Eu9g1X9sdsYvNN4YjT5b+DlOHRDL4ZVmCWbZ07YRy4xlfNG+o+dsFnRHEhcG
         pQr3JHpr9ucfVYXZd03OvHnrx3X18uPKa0j/MwarV9PKjW7M8AwS1tHeIJrEjXtxqfeR
         pt3IF24krJZRk+B3LL3mrvyKLxFcZw8ZPmKN5BzUPZqQNyYSp758/y+qlzVjkD/IPz3x
         FOO4/zXRu1EE+uMeSoHEN0tEiMg3/U8BaPuLFQl6vdqPDx0/MsbbrO/ZNCzK/1DoFz+M
         OQQctNxuC+JLS5O99N4xG1YgNHW0xdZ2qgrCBU/hGL623sD/igP95GnTrn5cIZuDe6a+
         n2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FlP/8WigIsRcy0M0emd8bnR6SWLSz57hj7Lf/K8LHqw=;
        fh=FzvgQbguqhvL6amYtwUTHg/SLeClZFb5WEZIJHj+KEM=;
        b=HPzWmxcYgks3HaK98bqW1GVSsXx+YrqWlrNu7rmlvYNKfSOEbjjKyZd8j/4F9FBpi9
         slj0VpqZdd9hIwkFTX03006rJERD3ISqay+bhlmU8j0HjfrVaJRLZH24SSWrS3jFY8HZ
         6aYkYvDBlMbEN81zbtQS9PMUkcYdzZkimbGYjCvA+BNJOYeq4zq3ZSZGc/ntgq7Bw/Q5
         zUr7VLQV0Z/yyb16GNu+HueHSpW0kmXwISJnQr2Gki/jAHcKtfhTzpjp22fscfNHXzRH
         USIv5xlliwMrTJPOC7pMNl18tLP7/vxDcwcjATEJrrpX9gMFE7Gr2MG3YriRdhsBdZka
         Z/qg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770668795; x=1771273595; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FlP/8WigIsRcy0M0emd8bnR6SWLSz57hj7Lf/K8LHqw=;
        b=cts8Gu9Vmke/4QgFieP+vaVaTCCfXgGv1Omoe1RZNbSSjEqhHXsgd43hnD16PVbKXL
         Jzr2xLVE+jHrjmFFHXGizLROyElBq1R8WOufMDah+qezs3nLvUZxluVebaWjTYPytZav
         sQhgy/wWRZtvCgub1p9dciQ7cfo0kBrkYHWbPiZs5jW5Clh3MJhLfFZohBIUm0JseqVD
         R3MuCbz1401YZ/kMg8MVmSxfbZ0Al5i6hj0TObpG5V/CnIDU2lR/YtSDZRG6iqosAcfv
         XF4shgUT0fiD0eoO4Cjddk1WkqkzllqLddEzz+5HqCax0/iop6fPa6M3j0L5Wacsqnbl
         KDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770668795; x=1771273595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlP/8WigIsRcy0M0emd8bnR6SWLSz57hj7Lf/K8LHqw=;
        b=DIcUtyH3VvAkWKZ8qydancSTd/A/iAWphNnLSlg+jnbVXfqviZOis347nM/Wn3Ri62
         +K5QucaS9+7x1e6fUsNq7+ZQE7ioPCNarKKpILLDVoSQoawSewZeMIr1EQhq44pvemRR
         rL1E09ewOopJyl2FnUN47MN8lvrS+LKIwlAR8+2mJ/j3syPI0JOyfXXqGezsXzmlliep
         BQPGiIKQ5OJ0P8W9SuR5NzhM4dVf/WyMStedmKOCJOaqrs1KlGFApmnyGJaD+p7p0G52
         NnwPWwQszhQujQuSNzAVuF9fwa6T8q4GWkpk0WpHSRV6B/ES0bXlZI+R/f0FnYLdNI4B
         GcLg==
X-Gm-Message-State: AOJu0Yx2b6P59ZqEsUSzGy+9uRBD9Chc/V5UWSnP9/VxNJtPtXD2t2H9
	XwHhy12aIQbnVZcob0L5GKY6mgT7wabDeNmXdodD695PcnshA+abtAxHszdQRbF6zYlgqc/V/mw
	Y5Czmn6pId/52Vhxo45BBVI73QF+zBpZpL0iQzZD/xNs4xPJxkhey4DQwHAH/2XWeHKsx2fEmG3
	4xUl2J3CfV4nFdsr1GWrwJmEdqWmRYVp9QYJMV2Q==
X-Gm-Gg: AZuq6aJVGdA5QxgFBZf06d9RXMi/va2Yl6uwcCidZ6qmTAD/xv1SmUR+k9nX/8b3Zu9
	ZE75qaFynz0Zm9hec7v48rIEpocJFhoNaZeCyWaqZqEMhB59SffPBisQFwsmZchMpKPLPnLwvy4
	6sEc/A28kBR/MsqmiNvAV7YTnredmY6ZVkxioXoBaAJX/4LpjvMfMYOe10RpJXxjvAzvK/BXouH
	MY4/HcmEoSQunmfy9JMSjVogg==
X-Received: by 2002:a17:903:98d:b0:2a0:ccb9:2f0a with SMTP id d9443c01a7336-2a95161fba4mr102782315ad.8.1770668794856;
        Mon, 09 Feb 2026 12:26:34 -0800 (PST)
X-Received: by 2002:a17:903:98d:b0:2a0:ccb9:2f0a with SMTP id
 d9443c01a7336-2a95161fba4mr102782115ad.8.1770668794371; Mon, 09 Feb 2026
 12:26:34 -0800 (PST)
MIME-Version: 1.0
References: <c35c5b10-3065-415f-9ce7-8749297d5207@oss.qualcomm.com>
In-Reply-To: <c35c5b10-3065-415f-9ce7-8749297d5207@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 22:26:23 +0200
X-Gm-Features: AZwV_Qh4r08UebWgcZtvdffPkWjfr2lvlrumK_tmKsS2FgocmdppfzOwDNNHRwU
Message-ID: <CAO9ioeWq9JzOtTzn8QFnj6z+qF4xHmKbK-0EH05YxhiGQgWH5w@mail.gmail.com>
Subject: Re: qcom: Add GPU firmwares for Glymur chipset
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=IeyKmGqa c=1 sm=1 tr=0 ts=698a42fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=xn2Qr1daXfYUriOpyBUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: HkJ9BL4rvEu_APjk32EVKpYRLpd3gK2d
X-Proofpoint-GUID: HkJ9BL4rvEu_APjk32EVKpYRLpd3gK2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE3MiBTYWx0ZWRfX4Tffp6OYunAc
 Fcysf4+hDSTRFv/IWNWtmWRbNEHBn8/lVvft25JlDsBBuRwiySdzAYhvRIynF7zSFtDhgNq27Z8
 y1K9vVOvgstKWP1LbKioT2bnzOr7OrV9OhlObshXyxBZusgH5nIuQsQBlLbwXYT+WpZY0OVGwUA
 ZOl6OG924mu5FkFrJydCSMPPa/btttfzJMHqLGvI1OcSUe8uqbPvJ51qcz2eAWTVS0puMJrQm+h
 qVyoeoraVzO1r+ycWz3ODwdXqqZeGCBxCyu5ehbM5sMHhCp3pnysnketPqf6j6us6MM3U+nV5km
 S4ZddldL0Ut8DHO0O7IXWVBTIS22ejhdgV2L/xPrv9O8szGI9fbyow/JHNC+nDYodl52CO8GDjV
 1uMFxVk8QspH+k7rdxOiNztbzWWvrw+TBdN5RCrx4I9Z7WgwXHdLDx4BStUNtunh1jHJ23C5hyP
 L+jGTNJpXB0dL01gUyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090172

On Mon, 9 Feb 2026 at 21:32, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>
> Hi,
>
> Add the gpu firmwares required for Qualcomm's Glymur chipset.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/914

>
> -Akhil


--
With best wishes
Dmitry
