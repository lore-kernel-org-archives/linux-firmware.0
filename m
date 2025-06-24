Return-Path: <SRS0=qWgD=ZH=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2234AC77B7C
	for <linux-firmware@archiver.kernel.org>; Tue, 24 Jun 2025 22:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3D66C4CEF3; Tue, 24 Jun 2025 22:39:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E882C4CEF4
	for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 22:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E882C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ODGYbg008956
	for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 22:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3xTBwOpO2vro0DymlE0e3dlfoqiXEK7SjBhAmKxUBbU=; b=pasIRHCRkQVltGDQ
	hH2trXRrG8LXdPxgNdy1Xn98r6iWPx89WCYOL+4OwcJCssseEN5BLXWThWTEXtca
	wnpMtu1Ib2eM1RUqff85meSRMl6WtoWFe5NkdULVARVqLnqtPJ/tWKdLUMhrdQGv
	MSty8csuru2aCgN4ikcf9pLo8kQ8p5nHphwcdIDCNkun6IWA79PcQknj1ScqXRe+
	L1Wq2LxTFcl5yjC8Jk1iZP9xM37mBK/cMam3h/6PVhgTPW5+kWHbNdj4M/D/7R7S
	0SOsZr4agRwK9X2dQUGvbaUJwaiTm8iXzqTrDxiTxE1y5kt35oUooGItJ9TBja1k
	Rky5/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmqep8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 22:39:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40f335529so51506485a.0
        for <linux-firmware@kernel.org>; Tue, 24 Jun 2025 15:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750804750; x=1751409550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xTBwOpO2vro0DymlE0e3dlfoqiXEK7SjBhAmKxUBbU=;
        b=GKwqmMwWogy+Y6ZDEUxGQqH5JrnS5GSpH2yCtRgxB1QXfas0tD0EHKnak9iz1185OB
         utQdoq+3Pj7vTHC7b6aHfhsx0vF2v4i1bE52E3lajSEjHQ4p654vy96SoIiqiXp93pJk
         sXHmP9b8uRpycINjG9QlNifzc13dZ9LugrZ/F1XQsGHseQNAlIZ7MOUddn4NQqBNQqah
         Y/0M49ytX91X+HkVbMa4ixtJ4SZbP+d4BOdxGkKlunbJEJxrQiT9NSnq/Wxc30s34A0X
         rcRDO4w5nEif/8DrL4x2FdwUHL/J5VJnpmx3FY7StQmSqkbpF6ibKWZ2+W1pv/vBJ9lj
         0rWg==
X-Gm-Message-State: AOJu0YyYyZVUXYfcReQR/d6W6zbotM3smATskqEmhlYTHjAx4Sh60wg8
	Frygm+Yohi++BVxeTYJuVsc+dCJV4OPOa+XeAy92JrtYnOR5/FdXhPD5Ug0tPHQeUQOF1E4KEs6
	kAlgh8pUnidJwRA4DEuCNhTQ+3xTMYa+0GyUsGwAKaVMDk0SOwr0DHtmst/aFXag=
X-Gm-Gg: ASbGnctyAvdoqtGTORQd0ZUpqM0r2KDRn/2iiTyQZiDqJXKEYilrq6oBEKNWsNUjJa0
	5V8ISqsoJLQqVGwaB7coeaB5Xyys20iUNxAjh7FbQov117NFIZTdw/TCrx3vMBG7yQv6Wl7dAYj
	A4CV8O8SL9v7eM9DOgsyyJL41RX6dR1xNoQ5wg+eTtBUJjl67azoj9qxv82pwoMVh5xBXr8vG1Q
	MUVnoUcYCyCUPY1J8pXq/tQma7Wwq9ynF/okoHkKGcuTw7egs5Wa2Y2TqrDsRigBCJTXvu3OxiC
	3sdcsT1c3Vzn63ZvlAptghVPGmT+hw8iBpoJxq4CN7WIjDPFQWQhujJ/cBJaGh6x7oyup5OjgxI
	R9gc29N/7owHmOek2Np5R96EiAUVboZ25mPU=
X-Received: by 2002:a05:620a:1926:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d41ec53bd0mr645803985a.21.1750804749887;
        Tue, 24 Jun 2025 15:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFEruZW5hypFzw1bN3CkD593Kv0FQu0yJlFS1k7QiLxefDvxbNsu0CEKcZ4KqgJHMOSCFqEw==
X-Received: by 2002:a05:620a:1926:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d41ec53bd0mr645800785a.21.1750804749466;
        Tue, 24 Jun 2025 15:39:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c4243sm1976038e87.175.2025.06.24.15.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:39:08 -0700 (PDT)
Date: Wed, 25 Jun 2025 01:39:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        quic_tingweiz@quicinc.com, quic_wangaow@quicinc.com
Subject: Re: add the firmware binary signed with Sectools v2 for qcs615
Message-ID: <ae4m27szjv5rp6d343l2pjxvbbcr42whxyuwq2bfvxxpq6zvjn@kmbtwbbijf7t>
References: <8db66c86-3624-4e7b-a0de-91895d423214@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8db66c86-3624-4e7b-a0de-91895d423214@quicinc.com>
X-Proofpoint-GUID: z0zNC5P3kaFOP5zR4Rp1ieIlMUx_uaNp
X-Proofpoint-ORIG-GUID: z0zNC5P3kaFOP5zR4Rp1ieIlMUx_uaNp
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685b290f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=lGK0cQbTcn6fYDm1jZAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MCBTYWx0ZWRfXzaEFhGtOCZzi
 XU7yALHHM25hqrLQrL09h2EG0+3DrJujCxAxecwXnix31vmdZWCP4qcg/Spk3kDH2/1eHNQnij5
 3KmEWRqVuhL2G8kxFjWPJL+YvBRJinVESRo451emZwJXDhnl/E5sAX1/qPQaxeoq90gQ0R+2zlS
 ULFSqKbB6aXujGd2tcBckX/NLUZUKec5euKLMTJNkS97yUgJ4PDMIFgWqLZk1iALopgNH7TNLYK
 uVkKAezZ6ZIYmtdXGNNrOSbBjHX/u8KNIDMtwjL/49B8ebuvZoI7Pn6Kl3fuiM5QaxwnzemnQbV
 GK5MQFpNIQpewenuMweq/68PnlvZgFLX/R5fIkNRt250wOLcMpGkMmWzmElMH0c3wh3SpBJU28o
 RooPzD1UuapQuJRYuCynG4SBwcnVjfymsfBmVo6I2WDO008iq0kH9H9cGJ9DIWCWOxEvA8Dt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=832 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240180

On Tue, Jun 24, 2025 at 05:11:37PM +0800, Renjiang Han wrote:
> Hello
> 
> The following changes since commit dbfe16e9e8acc74c018c39e541bdc3669b37f301:
> 
>   Revert "qcom: Add sdx61 Foxconn vendor firmware image file" (2025-06-23
> 12:15:33 -0400)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-qcs615
> 
> for you to fetch changes up to c319d6bea7a692fd9cee01d662dbbe8101e052f6:
> 
>   qcom: venus-5.4: add the firmware binary for qcs615 (2025-06-24 14:30:27
> +0530)

Well... No. Existing qcom/venus-5.4/venus.mbn already supports SOC_ID
6007, it uses the same MBN header (6) and PSS/SHA256 signature scheme.
Please describe actual differences.

Moreover, you are trying to push a newer version of the firmware
under the cover of providing a file with different signature. Even if
there is a need for a different signature, original firmware should also
be upgraded to the same version.

So... NAK.

-- 
With best wishes
Dmitry
